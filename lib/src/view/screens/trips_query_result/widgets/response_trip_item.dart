import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/flight_details.dart';
import '../../../../data/models/trip.dart';
import '../../../../localization/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_button.dart';
import '../../../utils/app_functions.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/enums.dart';

class ResponseTripItem extends StatelessWidget {
  final Trip trip;
  const ResponseTripItem({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Column(
        children: [
          TripDetailsHeader(
            flightDetails: trip.leaving,
            airelineName: mapAirlineCodeToName(trip.airline, appLoc),
          ),
          const SizedBox(height: 10),
          FlighTimingDetails(flightDetails: trip.leaving),
          Visibility(
            visible: trip.type == TripType.round,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Divider(
                  thickness: 2,
                  height: 0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                TripDetailsHeader(
                  flightDetails: trip.returning,
                  airelineName: mapAirlineCodeToName(trip.airline, appLoc),
                  airplaneDirection: -1,
                ),
                const SizedBox(height: 10),
                FlighTimingDetails(flightDetails: trip.returning),
              ],
            ),
          ),
          const SizedBox(height: 10),
          AppButton(
            onPressed: () {},
            text: appLoc.bookNow,
            icon: Text(trip.price.toString() + "\$\n" + appLoc.forOnePerson),
          )
        ],
      ),
    );
  }
}

class FlighTimingDetails extends StatelessWidget {
  const FlighTimingDetails({
    Key? key,
    required this.flightDetails,
  }) : super(key: key);

  final FlightDetails flightDetails;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.flight_takeoff_rounded),
              Text(appLoc.departurTime),
              Text(
                "${flightDetails.departureTime.hour}:${flightDetails.departureTime.minute}",
                style: AppTextStyles.body(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    thickness: 3,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.flight_land_rounded),
              Text(appLoc.arriveTime),
              Text(
                "${flightDetails.arriveTime.hour}:${flightDetails.arriveTime.minute}",
                style: AppTextStyles.body(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
