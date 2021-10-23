import 'package:flutter/material.dart';
import 'package:otb_client/src/view/utils/app_text_styles.dart';

class AirlineCard extends StatefulWidget {
  final String airlineImage;
  final Function(bool?) onSelected;
  final String airlineName;
  const AirlineCard({
    Key? key,
    required this.airlineImage,
    required this.airlineName,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<AirlineCard> createState() => _AirlineCardState();
}

class _AirlineCardState extends State<AirlineCard> {
  bool isSelected = true;
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
            value: isSelected,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (newVal) {
              setState(() {
                isSelected = newVal!;
              });
              widget.onSelected(newVal);
            },
          ),
          const SizedBox(width: 20),
          Image.asset(widget.airlineImage, width: 30),
          const SizedBox(width: 20),
          Text(
            widget.airlineName,
            style: AppTextStyles.buttonTextStyle(),
          ),
        ],
      ),
    );
  }
}
