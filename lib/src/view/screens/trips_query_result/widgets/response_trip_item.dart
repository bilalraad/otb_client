import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'trip_details_header.dart';
import '../../../../data/models/trip.dart';
import '../../../../localization/app_localizations.dart';
import '../../../utils/app_button.dart';
import '../../../utils/app_functions.dart';
import '../../../utils/enums.dart';
import 'fligh_timing_details.dart';

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
