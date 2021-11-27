import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../data/models/flight_details.dart';
import '../../../utils/app_text_styles.dart';

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
                DateFormat.jm()
                    .format(flightDetails.departureTime!.toDateTime()),
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
                DateFormat.jm().format(flightDetails.arriveTime!.toDateTime()),
                style: AppTextStyles.body(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
