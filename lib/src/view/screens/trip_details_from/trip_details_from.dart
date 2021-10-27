import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:otb_client/src/data/fake_data.dart';
import 'package:otb_client/src/view/utils/app_functions.dart';
import 'package:otb_client/src/view/screens/trip_details_from/widgets/radio_selector.dart';
import '../../../data/models/trips_query.dart';
import '../../../localization/app_localizations.dart';
import '../../utils/app_appbar.dart';
import '../../utils/app_button.dart';
import '../../utils/app_text_styles.dart';
import 'widgets/date_picker.dart';
import 'widgets/select_catgeory_and_type.dart';
import 'widgets/select_country.dart';
import 'widgets/travelers_number_card.dart';

class TripDetailsForm extends StatefulWidget {
  final List<String> selectedAirlines;
  const TripDetailsForm({Key? key, required this.selectedAirlines})
      : super(key: key);

  @override
  State<TripDetailsForm> createState() => _TripDetailsFormState();
}

class _TripDetailsFormState extends State<TripDetailsForm> {
  int tripTypeGroupValue = 0;
  int tripCategoryGroupValue = 0;
  bool isOneWay = true;
  TripsQuery newQuery = TripsQuery.initial();

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: appAppbar(onBackPressed: () {
        Navigator.of(context).pop();
      }),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectCatgeoryAndType(
              onCategorySelected: (v) {
                print(v);
                newQuery = newQuery.copyWith(tripCategory: v);
              },
              onTypeSelected: (v) {
                newQuery = newQuery.copyWith(type: v);
                setState(() {
                  isOneWay = !isOneWay;
                });
              },
            ),
            const SizedBox(height: 10),
            SelectCity(
              excludeCountry: newQuery.arriveCity,
              onCitySelected: (val) {
                newQuery = newQuery.copyWith(departureCity: val.code);
                setState(() {});
              },
              title: appLoc.depatrueCiry,
              icon: Icons.flight_takeoff_rounded,
            ),
            const SizedBox(height: 10),
            SelectCity(
              excludeCountry: newQuery.departureCity,
              onCitySelected: (val) {
                newQuery = newQuery.copyWith(arriveCity: val.code);
                setState(() {});
              },
              title: appLoc.returnCiry,
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppDatePicker(
                  title: appLoc.dapatureDate,
                  onDateSelected: (newDepDate) {
                    newQuery = newQuery.copyWith(
                        leaveDate: newDepDate.toIso8601String());
                  },
                ),
                if (!isOneWay)
                  AppDatePicker(
                    title: appLoc.returnDate,
                    onDateSelected: (newReturnDate) {
                      newQuery = newQuery.copyWith(
                          returnDate: newReturnDate.toIso8601String());
                    },
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              appLoc.travelers,
              style: AppTextStyles.subHeaderStyle(),
            ),
            const SizedBox(height: 10),
            TravelersNumberCard(
                initialValue: newQuery.travelers.adults,
                onChanged: (adults) {
                  newQuery = newQuery.copyWith(
                      travelers: newQuery.travelers.copyWith(adults: adults));
                },
                title: appLoc.adults + ' (${appLoc.olderthan12})'),
            const SizedBox(height: 10),
            TravelersNumberCard(
                onChanged: (kids) {
                  newQuery = newQuery.copyWith(
                      travelers: newQuery.travelers.copyWith(kids: kids));
                },
                title: appLoc.kids + ' (${appLoc.between3and12})'),
            const SizedBox(height: 10),
            TravelersNumberCard(
                onChanged: (infants) {
                  newQuery = newQuery.copyWith(
                      travelers: newQuery.travelers.copyWith(infants: infants));
                },
                title: appLoc.infants + ' (${appLoc.lessThanTwo})'),
            const Spacer(),
            AppButton(
              onPressed: () {
                try {
                  validateTripQuery(newQuery, appLoc);
                  launchWhatsApp(query: newQuery);
                } catch (e) {
                  EasyLoading.showToast(e.toString());
                }
              },
              text: appLoc.contactThroughWhatsApp,
              buttonType: ButtonType.secondary,
            ),
            const SizedBox(height: 10),
            AppButton(
                onPressed: () {
                  print(newQuery.toString());
                },
                text: appLoc.searchThroughApp),
          ],
        ),
      ),
    );
  }
}
