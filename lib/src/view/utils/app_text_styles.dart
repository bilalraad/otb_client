import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle inputStyle({
    double size = 14,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        color: AppColors.primaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle subHeaderStyle({
    double size = 18,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        color: AppColors.black,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle headerStyle({
    double size = 24,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        color: AppColors.black,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle buttonTextStyle({
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        color: AppColors.primaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );

  static TextStyle body({
    double size = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color textColor = AppColors.black,
  }) =>
      TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
}
