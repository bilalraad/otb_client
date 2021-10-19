import 'package:flutter/material.dart';
import 'package:otb_client/view/home.dart';

void main() {
  runApp(const OTBApp());
}

class OTBApp extends StatelessWidget {
  const OTBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
