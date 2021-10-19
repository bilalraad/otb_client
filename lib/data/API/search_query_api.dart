import 'dart:async';

import 'package:otb_client/data/fake_data.dart';
import 'package:otb_client/data/models/book_trip.dart';
import 'package:otb_client/data/models/trips_query.dart';
import 'package:otb_client/data/models/trips_query_result.dart';

abstract class BaseTripsQueryApi {
  Future<void> sendTripsQuery(TripsQuery query);
  Stream<TripsQueryResult> getTripsResult(String queryId);
  Future<void> confirmOrder(BookTrip bookOrder);
}

class MockTripsQueryApi extends BaseTripsQueryApi {
  @override
  Future<void> confirmOrder(BookTrip bookOrder) async {
    return await Future.delayed(const Duration(seconds: 2), () {
      print(bookOrder.toMap());
    });
  }

  @override
  Stream<TripsQueryResult> getTripsResult(String queryId) async* {
    await Future.delayed(const Duration(seconds: 10));
    yield TripsQueryResult.fromMap(searchResult);
  }

  @override
  Future<void> sendTripsQuery(TripsQuery query) async {
    await Future.delayed(const Duration(seconds: 2));

    print(query.toMap());
  }
}
