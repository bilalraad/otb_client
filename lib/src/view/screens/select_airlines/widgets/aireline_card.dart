import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class AirlineCard extends StatelessWidget {
  final String airlineImage;
  final bool value;
  final Function(bool?) onSelected;
  final String airlineName;
  const AirlineCard({
    Key? key,
    required this.airlineImage,
    required this.airlineName,
    required this.onSelected,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            activeColor: Theme.of(context).colorScheme.primary,
            onChanged: onSelected,
          ),
          const SizedBox(width: 20),
          Image.asset(airlineImage, width: 30),
          const SizedBox(width: 20),
          Text(
            airlineName,
            style: AppTextStyles.buttonTextStyle(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
