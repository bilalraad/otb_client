import 'package:flutter/material.dart';
import 'package:otb_client/data/API/search_query_api.dart';
import 'package:otb_client/data/models/trips_query_result.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<TripsQueryResult>(
          stream: MockTripsQueryApi().getTripsResult(''),
          builder: (context, snapshot) {
            final result = snapshot.data;
            return Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              child: Text(result?.resultItems.first.airline ?? ''),
            );
          }),
    );
  }
}
