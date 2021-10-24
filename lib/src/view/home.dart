import 'package:flutter/material.dart';
import 'package:otb_client/src/data/models/airline.dart';
import 'package:otb_client/src/localization/app_localizations.dart';
import 'package:otb_client/src/view/utils/app_button.dart';
import 'package:otb_client/src/view/utils/app_text_styles.dart';
import 'utils/app_appbar.dart';
import 'utils/app_assets.dart';
import 'utils/create_route.dart';
import 'utils/widgets/aireline_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> selectedAirLines = ['THY', 'IAW', 'MEA', 'FBA', 'SAW'];
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    final supportedAirLines = [
      AireLine(appLoc.tukishAirline, AppAssets.turkishAirlinesLogo, 'THY'),
      AireLine(appLoc.iraqiAirline, AppAssets.iraqiAirlinesLogo, 'IAW'),
      AireLine(appLoc.lebanonAirline, AppAssets.lebanonAirlinesLogo, 'MEA'),
      AireLine(appLoc.flyBaghdad, AppAssets.flyBagdadLogo, 'FBA'),
      AireLine(appLoc.shamWings, AppAssets.shamWingsLogo, 'SAW'),
    ];

    return Scaffold(
      appBar: appAppbar(showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                appLoc.pleaseSelectAirlines,
                style: AppTextStyles.subHeaderStyle(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: supportedAirLines.length == selectedAirLines.length,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (allSelected) {
                    if (allSelected!) {
                      selectedAirLines.clear();
                      for (var a in supportedAirLines) {
                        selectedAirLines.add(a.code);
                      }
                    } else {
                      selectedAirLines = [];
                    }
                    setState(() {});
                  },
                ),
                Text(appLoc.all)
              ],
            ),
            const Divider(thickness: 2),
            Column(
              children: supportedAirLines.map<Widget>(
                (a) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AirlineCard(
                      value: selectedAirLines.contains(a.code),
                      airlineImage: a.logo,
                      airlineName: a.name,
                      onSelected: (selected) {
                        if (selected!) {
                          selectedAirLines.add(a.code);
                        } else {
                          selectedAirLines.remove(a.code);
                        }
                        setState(() {});
                      },
                    ),
                  );
                },
              ).toList(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AppButton(
                onPressed: () {
                  Navigator.of(context).push(createRoute(TripDetailsForm()));
                },
                text: 'next',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TripDetailsForm extends StatelessWidget {
  const TripDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
