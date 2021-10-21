import 'package:flutter/material.dart';
import 'package:otb_client/src/data/API/search_query_service.dart';
import 'package:otb_client/src/data/models/trips_query_result.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<TripsQueryResult>(
          stream: MockTripsQueryService().getTripsResult(''),
          builder: (context, snapshot) {
            final result = snapshot.data;
            return Column(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('khg')),
                // Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.amber,
                //   child: Text(result?.resultItems.first.airline ?? ''),
                // ),
              ],
            );
          }),
    );
  }
}
