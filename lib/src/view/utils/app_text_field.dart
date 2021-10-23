import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String lableText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? minLines;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  const AppTextField({
    Key? key,
    required this.lableText,
    this.hintText,
    this.icon,
    this.onChanged,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.minLines,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      style: AppTextStyles.inputStyle(),
      maxLines: minLines ?? 1,
      decoration: InputDecoration(
        labelText: lableText,
        icon: icon != null ? Icon(icon, size: 20) : null,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
