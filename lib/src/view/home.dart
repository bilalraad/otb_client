import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_query/search_query_bloc.dart';
import 'screens/trips_query_result/trips_query_result_page.dart';

import 'screens/select_airlines/select_airlines_screen.dart';
import 'utils/logger.dart';

Future<dynamic> _onBackgroundMessage(RemoteMessage message) async {
  logger(FirebaseMessaging).d(message);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//click_action
//FLUTTER_NOTIFICATION_CLICK
class _HomeState extends State<Home> {
  @override
  void initState() {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.subscribeToTopic('all');
    messaging.setAutoInitEnabled(true);

    if (Platform.isIOS) {
      messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }

    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessage.listen((event) {
      logger(_HomeState).d(event.notification);
      logger(_HomeState).d(event);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<TripsQueryBloc>();
    if (queryBloc.state is SearchQueryWaitingForResponse) {
      return const TripsQueryResultPage();
    }
    return const SelectAirlinesScreen();
  }
}
