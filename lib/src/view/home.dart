import 'package:flutter/material.dart';
import 'package:otb_client/src/data/API/search_query_service.dart';
import 'package:otb_client/src/data/models/trips_query_result.dart';
import 'package:otb_client/src/view/utils/app_assets.dart';
import 'package:otb_client/src/view/utils/widgets/aireline_card.dart';

import 'utils/app_text_field.dart';
import 'utils/app_button.dart';
import 'utils/widgets/date_picker.dart';
import 'utils/widgets/select_country.dart';
import 'utils/widgets/travelers_number_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<TripsQueryResult>(
          stream: MockTripsQueryService().getTripsResult(''),
          builder: (context, snapshot) {
            final result = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                      onPressed: () {},
                      text: 'khg',
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                  const AppTextField(lableText: 'الاسم'),
                  const SizedBox(height: 20),
                  AirlineCard(
                    airlineImage: AppAssets.flyBagdadLogo,
                    airlineName: 'الخطوط الجوية العراقية',
                    onSelected: (val) {
                      print(val);
                    },
                  ),
                  const SizedBox(height: 20),
                  TravelersNumberCard(
                    initialValue: 0,
                    onChanged: (b) {
                      print(b);
                    },
                    title: 'البالغين',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppDatePicker(
                        title: 'kkmk',
                        onDateSelected: (date) {
                          print(date);
                        },
                      ),
                      AppDatePicker(
                        title: 'kkmk',
                        onDateSelected: (date) {
                          print(date);
                        },
                      ),
                    ],
                  ),
                  SelectAirport(
                    icon: Icons.flight_takeoff_rounded,
                    title: 'وقت الأنطلاق',
                    onCitySelected: (airport) {
                      print(airport.code);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
