import 'package:flutter/material.dart';

import 'app_text_styles.dart';

enum ButtonType {
  primary,
  secondary,
}

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? textColor;
  final Color? backroundColor;
  final ButtonType buttonType;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonType = ButtonType.primary,
    this.width,
    this.textColor,
    this.backroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPrimary = buttonType == ButtonType.primary;
    final buttonBgColor = isPrimary
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.background;
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: backroundColor ?? buttonBgColor,
            shape: RoundedRectangleBorder(
                side: isPrimary
                    ? BorderSide.none
                    : BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                borderRadius: BorderRadius.circular(10))),
        child: Container(
          width: width,
          height: 50,
          padding: const EdgeInsets.all(3),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyles.buttonTextStyle().copyWith(color: textColor),
          ),
        ));
  }
}
