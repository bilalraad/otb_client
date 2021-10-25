import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../data/models/airline.dart';
import '../../localization/app_localizations.dart';
import '../utils/app_appbar.dart';
import '../utils/app_button.dart';
import '../utils/app_text_styles.dart';
import '../utils/create_route.dart';
import '../utils/widgets/aireline_card.dart';

import 'trip_details_from.dart';

class SelectAirlinesScreen extends StatefulWidget {
  final List<AireLine> supportedAirLines;
  const SelectAirlinesScreen({Key? key, required this.supportedAirLines})
      : super(key: key);

  @override
  State<SelectAirlinesScreen> createState() => _SelectAirlinesScreenState();
}

class _SelectAirlinesScreenState extends State<SelectAirlinesScreen> {
  List<String> selectedAirLines = ['THY', 'IAW', 'MEA', 'FBA', 'SAW'];

  List<AireLine> get _supportedAirLines => widget.supportedAirLines;

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
                  value: _supportedAirLines.length == selectedAirLines.length,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (allSelected) {
                    if (allSelected!) {
                      selectedAirLines.clear();
                      for (var a in widget.supportedAirLines) {
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
              children: _supportedAirLines.map<Widget>(
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
                  if (selectedAirLines.isEmpty) {
                    EasyLoading.showToast('Please Select at least one airline');
                  } else {
                    Navigator.of(context).push(createRoute(
                      TripDetailsForm(selectedAirlines: selectedAirLines),
                    ));
                  }
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
