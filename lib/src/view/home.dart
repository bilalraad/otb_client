import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'screens/select_airlines/select_airlines_screen.dart';

Future<dynamic> _onBackgroundMessage(RemoteMessage message) async {
  print(message.notification);
  final player = AudioPlayer();
  await player.setAsset('assets/files/notification_sound.wav');
  player.play();
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
      print('object');
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
      print(event.notification);
      print(event);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SelectAirlinesScreen();
  }
}
