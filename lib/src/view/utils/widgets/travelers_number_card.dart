import 'package:flutter/material.dart';
import '../app_text_styles.dart';

class TravelersNumberCard extends StatefulWidget {
  final Function(int) onChanged;
  final int initialValue;
  final String title;

  const TravelersNumberCard(
      {Key? key,
      required this.onChanged,
      this.initialValue = 0,
      required this.title})
      : super(key: key);

  @override
  _TravelersNumberCardState createState() => _TravelersNumberCardState();
}

class _TravelersNumberCardState extends State<TravelersNumberCard> {
  late int currentValue;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.5)),
          ]),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              widget.title,
              style: AppTextStyles.inputStyle(),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              if (currentValue != 0) {
                setState(() {
                  currentValue = currentValue - 1;
                  widget.onChanged(currentValue);
                });
              }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(currentValue.toString()),
          IconButton(
            onPressed: () {
              setState(() {
                currentValue = currentValue + 1;
              });
              widget.onChanged(currentValue);
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
