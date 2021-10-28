import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../utils/enums.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_functions.dart';
import '../../../data/models/airline.dart';
import '../../../localization/app_localizations.dart';
import '../../utils/app_appbar.dart';
import '../../utils/app_button.dart';
import '../../utils/app_text_styles.dart';
import 'widgets/aireline_card.dart';

import '../trip_details_from/trip_details_from.dart';

class SelectAirlinesScreen extends StatefulWidget {
  const SelectAirlinesScreen({Key? key}) : super(key: key);

  @override
  State<SelectAirlinesScreen> createState() => _SelectAirlinesScreenState();
}

class _SelectAirlinesScreenState extends State<SelectAirlinesScreen> {
  List<Airline> selectedAirLines = Airline.values;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

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
                  value: Airline.values.length == selectedAirLines.length,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (allSelected) {
                    if (allSelected!) {
                      selectedAirLines.clear();
                      for (var a in Airline.values) {
                        selectedAirLines.add(a);
                      }
                    } else {
                      selectedAirLines = [];
                    }
                    setState(() {});
                  },
                ),
                Text(appLoc.all,
                    style: AppTextStyles.buttonTextStyle(
                        color: AppColors.primaryColor))
              ],
            ),
            const Divider(thickness: 2),
            Column(
              children: Airline.values.map<Widget>(
                (a) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AirlineCard(
                      value: selectedAirLines.contains(a),
                      airlineImage: mapAirlineCodeToLogo(a),
                      airlineName: mapAirlineCodeToName(a, appLoc),
                      onSelected: (selected) {
                        if (selected!) {
                          selectedAirLines.add(a);
                        } else {
                          selectedAirLines.remove(a);
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
                  if (selectedAirLines.isEmpty) {
                    EasyLoading.showError(appLoc.pleaseSelectOneAirline);
                  } else {
                    Navigator.of(context).push(createRoute(
                      TripDetailsForm(selectedAirlines: selectedAirLines),
                    ));
                  }
                },
                text: appLoc.next,
              ),
            )
          ],
        ),
      ),
    );
  }
}
