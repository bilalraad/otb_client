import 'package:flutter/material.dart';
import 'app_colors.dart';

import 'app_assets.dart';

AppBar appAppbar({
  bool showBackButton = true,
  VoidCallback? onBackPressed,
  List<Widget>? actions,
}) {
  return AppBar(
    centerTitle: true,
    actions: actions,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: AppColors.secondaryColor),
            onPressed: onBackPressed,
          )
        : const SizedBox(),
    title: SizedBox(
      width: 100,
      child: Image.asset(AppAssets.applogo),
    ),
  );
}
