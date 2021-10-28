import 'package:flutter/material.dart';

import '../../../../data/models/airport.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class SelectCity extends StatefulWidget {
  final Function(Airport) onCitySelected;
  final String title;
  final IconData icon;

  ///useful when you want to prevent the user from slecting same cities for
  ///departur and return
  final String? excludeCountry;
  const SelectCity(
      {Key? key,
      required this.onCitySelected,
      required this.title,
      required this.icon,
      this.excludeCountry})
      : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  String? selectedAirport;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: (MediaQuery.of(context).size.width / 2) - 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.5)),
          ]),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              builder: (_) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'اختر مدينة الانطلاق',
                          style: AppTextStyles.subHeaderStyle(),
                        ),
                      ),
                      const Divider(thickness: 2),
                      Expanded(
                        child: ListView(
                          children: Airport.supportedAirports.map((c) {
                            if (widget.excludeCountry != c.code) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: InkWell(
                                      onTap: () {
                                        widget.onCitySelected(c);
                                        setState(() {
                                          selectedAirport = c.provanceName;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 50,
                                            child: Image.asset(c.countryImage),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            c.provanceName,
                                            style:
                                                AppTextStyles.subHeaderStyle(),
                                          ),
                                          const Spacer(),
                                          Text(
                                            c.code,
                                            style: AppTextStyles.subHeaderStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(thickness: 2),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Text(selectedAirport ?? widget.title),
          ],
        ),
      ),
    );
  }
}
