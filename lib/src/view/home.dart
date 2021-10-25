import 'package:flutter/material.dart';
import 'package:otb_client/src/data/models/airline.dart';
import 'package:otb_client/src/localization/app_localizations.dart';
import 'package:otb_client/src/view/screens/select_airlines_screen.dart';
import 'utils/app_assets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    final _supportedAirLines = [
      AireLine(appLoc.tukishAirline, AppAssets.turkishAirlinesLogo, 'THY'),
      AireLine(appLoc.iraqiAirline, AppAssets.iraqiAirlinesLogo, 'IAW'),
      AireLine(appLoc.lebanonAirline, AppAssets.lebanonAirlinesLogo, 'MEA'),
      AireLine(appLoc.flyBaghdad, AppAssets.flyBagdadLogo, 'FBA'),
      AireLine(appLoc.shamWings, AppAssets.shamWingsLogo, 'SAW'),
    ];

    return SelectAirlinesScreen(supportedAirLines: _supportedAirLines);
  }
}
