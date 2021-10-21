import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otb_client/src/data/fake_data.dart';
import 'package:otb_client/src/data/models/book_trip.dart';
import 'package:otb_client/src/data/models/trips_query.dart';
import 'package:otb_client/src/data/models/trips_query_result.dart';

abstract class BaseTripsQueryService {
  Future<void> sendTripsQuery(TripsQuery query);
  Stream<TripsQueryResult> getTripsResult(String queryId);
  Future<void> confirmOrder(BookTrip bookOrder);
}

class MockTripsQueryService extends BaseTripsQueryService {
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
  Stream<TripsQueryResult> getTripsResult(String queryId) async* {
    final random = Random();
    if (random.nextBool()) {
      await Future.delayed(const Duration(seconds: 10));
      yield TripsQueryResult.fromMap(searchResult);
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
}
