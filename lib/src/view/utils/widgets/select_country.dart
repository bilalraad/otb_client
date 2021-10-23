import 'package:flutter/material.dart';
import 'package:otb_client/src/data/models/airport.dart';
import 'package:otb_client/src/view/utils/app_colors.dart';
import 'package:otb_client/src/view/utils/app_text_styles.dart';

class SelectAirport extends StatefulWidget {
  final Function(Airport) onCitySelected;
  final String title;
  final IconData icon;

  ///useful when you want to prevent the user from slecting same cities for
  ///departur and return
  final String? excludeCountry;
  const SelectAirport(
      {Key? key,
      required this.onCitySelected,
      required this.title,
      required this.icon,
      this.excludeCountry})
      : super(key: key);

  @override
  State<SelectAirport> createState() => _SelectAirportState();
}

class _SelectAirportState extends State<SelectAirport> {
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
          showBottomSheet(
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
                      Text(
                        'اختر مدينة الانطلاق',
                        style: AppTextStyles.subHeaderStyle(),
                      ),
                      const Divider(thickness: 2),
                      Expanded(
                        child: ListView(
                          children: Airport.supportedAirports.map((c) {
                            if (widget.excludeCountry != c.countryName) {
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
            Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 10),
            Text(selectedAirport ?? widget.title),
          ],
        ),
      ),
    );
  }
}
