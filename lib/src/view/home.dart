import 'package:flutter/material.dart';

import 'screens/select_airlines/select_airlines_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SelectAirlinesScreen();
  }
}
