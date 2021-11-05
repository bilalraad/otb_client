import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';

import '../fake_data.dart';
import '../models/book_trip.dart';
import '../models/trips_query.dart';

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
        print(bookOrder.toMap());
      } else {
        throw FlutterError('network Error');
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
      throw FlutterError('network Error');
    }
  }

  @override
  Future<void> sendTripsQuery(TripsQuery query) async {
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    if (random.nextBool()) {
      print(query.toMap());
    } else {
      throw FlutterError('network Error');
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
    try {
      await _fireStore.collection('confirmedOrders').add(bookOrder.toMap());
    } catch (e) {
      rethrow;
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
    try {
      await _fireStore
          .collection('quries')
          .doc(query.queryId)
          .set(query.toMap());

      //TODO: Remove after testing complete
      Future.delayed(const Duration(seconds: 10), () {
        for (var item
            in searchResult['resultItems'] as List<Map<String, dynamic>>) {
          _fireStore
              .collection('quries')
              .doc(query.queryId)
              .collection('queryResults')
              .add(item);
        }
      });
    } catch (e) {
      //TODO: HANDEL ERRORS;
      rethrow;
    }
  }

  List<Trip> _tripsfromDocSnap(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> queryResults) {
    List<Trip> _trips = [];

    for (var trip in queryResults) {
      _trips.add(Trip.fromMap(trip.data()));
    }
    return _trips;
  }
}
