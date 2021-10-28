import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../localization/app_localizations.dart';
import 'radio_selector.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/enums.dart';

class SelectCatgeoryAndType extends StatefulWidget {
  final Function(TripCategory) onCategorySelected;
  final Function(TripType) onTypeSelected;

  const SelectCatgeoryAndType(
      {Key? key,
      required this.onCategorySelected,
      required this.onTypeSelected})
      : super(key: key);

  @override
  _SelectCatgeoryAndTypeState createState() => _SelectCatgeoryAndTypeState();
}

class _SelectCatgeoryAndTypeState extends State<SelectCatgeoryAndType> {
  TripType tripTypeGroupValue = TripType.oneWay;
  TripCategory tripCategoryGroupValue = TripCategory.economic;
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLoc.tripCategory,
              style: AppTextStyles.subHeaderStyle(),
            ),
            RadioSelector<TripCategory>(
              onSelected: (v) {
                setState(() {
                  tripCategoryGroupValue = v!;
                  widget.onCategorySelected(v);
                });
              },
              value: TripCategory.economic,
              title: appLoc.economic,
              valueSelected: tripCategoryGroupValue,
            ),
            RadioSelector<TripCategory>(
              onSelected: (v) {
                setState(() {
                  tripCategoryGroupValue = v!;
                  widget.onCategorySelected(v);
                });
              },
              value: TripCategory.business,
              title: appLoc.bussines,
              valueSelected: tripCategoryGroupValue,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLoc.tripType,
              style: AppTextStyles.subHeaderStyle(),
            ),
            RadioSelector<TripType>(
              onSelected: (v) {
                setState(() {
                  tripTypeGroupValue = v!;
                  widget.onTypeSelected(v);
                });
              },
              value: TripType.oneWay,
              title: appLoc.oneWay,
              valueSelected: tripTypeGroupValue,
            ),
            RadioSelector<TripType>(
              onSelected: (v) {
                setState(() {
                  tripTypeGroupValue = v!;
                  widget.onTypeSelected(v);
                });
              },
              value: TripType.round,
              title: appLoc.round,
              valueSelected: tripTypeGroupValue,
            ),
          ],
        ),
      ],
    );
  }
}
