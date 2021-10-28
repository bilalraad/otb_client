import 'package:flutter/material.dart';
import '../../../utils/app_text_styles.dart';

class RadioSelector<T> extends StatelessWidget {
  final String title;
  final Function(T?) onSelected;
  final T value;
  final T valueSelected;
  const RadioSelector({
    Key? key,
    required this.title,
    required this.onSelected,
    required this.value,
    required this.valueSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Radio<T>(
              value: value,
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue: valueSelected,
              onChanged: onSelected,
              // dense: true,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppTextStyles.buttonTextStyle(
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
