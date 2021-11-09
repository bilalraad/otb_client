import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:otbclient/src/view/utils/logger.dart';

import '../exceptions/exceptions.dart';
import '../models/trip.dart';
import '../fake_data.dart';
import '../models/book_trip.dart';
import '../models/trips_query.dart';

///To check the internet connection and data connection
Future<bool> connected() async {
  try {
    if (await DataConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    return false;
  }
}

abstract class BaseTripsQueryService {
  Future<void> sendTripsQuery(TripsQuery query);
  Stream<List<Trip>> getTripsResult(String queryId);
  Future<void> confirmOrder(BookTrip bookOrder);
}

class MockTripsQueryService extends BaseTripsQueryService {
  static final MockTripsQueryService _mockservice =
      MockTripsQueryService._internal();

  factory MockTripsQueryService() {
    return _mockservice;
  }

  MockTripsQueryService._internal();

  @override
  Future<void> confirmOrder(BookTrip bookOrder) async {
    return await Future.delayed(const Duration(seconds: 2), () {
      final random = Random();
      if (random.nextBool()) {
        logger(MockTripsQueryService).d(bookOrder);
      } else {
        throw UnknownErrorException();
      }
    });
  }

  @override
  Stream<List<Trip>> getTripsResult(String queryId) async* {
    final random = Random();
    final fakeItems = _tripsfromjson(
        searchResult['resultItems'] as List<Map<String, dynamic>>);
    if (random.nextBool()) {
      await Future.delayed(const Duration(seconds: 10));
      yield _tripsfromjson(
          searchResult['resultItems'] as List<Map<String, dynamic>>);
      await Future.delayed(const Duration(seconds: 10));
      yield fakeItems..add(Trip.fromMap(fakeTrip));
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<void> sendTripsQuery(TripsQuery query) async {
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    if (random.nextBool()) {
      logger(MockTripsQueryService).d(query);
    } else {
      throw NetworkException();
    }
  }

  List<Trip> _tripsfromjson(List<Map<String, dynamic>> queryResults) {
    List<Trip> _trips = [];

    for (var trip in queryResults) {
      _trips.add(Trip.fromMap(trip));
    }
    return _trips;
  }
}

class FirebaseTripsQueryService extends BaseTripsQueryService {
  final _fireStore = FirebaseFirestore.instance;

  static final FirebaseTripsQueryService _mockservice =
      FirebaseTripsQueryService._internal();

  factory FirebaseTripsQueryService() {
    return _mockservice;
  }

  FirebaseTripsQueryService._internal();

  @override
  Future<void> confirmOrder(BookTrip bookOrder) async {
    if (!await connected()) {
      throw NetworkException();
    }
    try {
      await _fireStore.collection('confirmedOrders').add(bookOrder.toMap());
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  @override
  Stream<List<Trip>> getTripsResult(String queryId) {
    return _fireStore
        .collection('quries')
        .doc(queryId)
        .collection('queryResults')
        .snapshots()
        .map((snap) => snap.docs)
        .map((docs) => _tripsfromDocSnap(docs));
  }

  @override
  Future<void> sendTripsQuery(TripsQuery query) async {
    if (!await connected()) {
      throw NetworkException();
    }
    try {
      await _fireStore
          .collection('quries')
          .doc(query.queryId)
          .set(query.toMap());
      //TODO: SEND EMAIL TO ROA
      //TODO: SEND NOTIFICATION TO THE ADMING APP
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  List<Trip> _tripsfromDocSnap(
      List<QueryDocumentSnapshot<Map<String, dynamic>>>? queryResults) {
    logger(FirebaseTripsQueryService).d('queryResults');
    logger(FirebaseTripsQueryService).d(queryResults);
    List<Trip> _trips = [];
    if (queryResults != null) {
      for (var trip in queryResults) {
        logger(FirebaseTripsQueryService).d(trip.data());
        _trips.add(Trip.fromMap(trip.data()));
      }
    }

    return _trips;
  }
}
