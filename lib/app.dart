import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/localization/app_localizations.dart';
import 'src/view/home.dart';

class OTBApp extends StatelessWidget {
  const OTBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''),
      ],
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        primary: Colors.black,
        primaryVariant: Colors.blueGrey,
        secondary: Colors.amber,
        secondaryVariant: Colors.amber,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
      )),
      home: const Home(),
    );
  }
}
