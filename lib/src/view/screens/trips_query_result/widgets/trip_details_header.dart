import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/flight_details.dart';
import '../../../../localization/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_functions.dart';
import '../../../utils/app_text_styles.dart';

class TripDetailsHeader extends StatelessWidget {
  const TripDetailsHeader({
    Key? key,
    required this.flightDetails,
    required this.airelineName,
    this.airplaneDirection = 1,
  }) : super(key: key);

  final FlightDetails flightDetails;
  final String airelineName;
  final int airplaneDirection;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10 + 2),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      describeEnum(flightDetails.to),
                      style: AppTextStyles.subHeaderStyle(
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        mapAirportCodeToName(flightDetails.to, appLoc),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                RotatedBox(
                  quarterTurns: airplaneDirection,
                  child: const Icon(Icons.flight_outlined),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      describeEnum(flightDetails.from),
                      style: AppTextStyles.subHeaderStyle(
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        mapAirportCodeToName(flightDetails.from, appLoc),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Image.asset(AppAssets.iraqiAirlinesLogo),
                    ),
                    const SizedBox(width: 10),
                    Text(airelineName),
                  ],
                ),
                Text(
                  flightDetails.date.day.toString() +
                      "/" +
                      flightDetails.date.month.toString() +
                      "/" +
                      flightDetails.date.year.toString(),
                  style: AppTextStyles.body(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
