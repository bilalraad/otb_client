import 'package:flutter/material.dart';
import 'package:otbclient/src/view/screens/info_screen.dart';
import 'package:otbclient/src/view/utils/utils.dart';
import 'app_colors.dart';

import 'app_assets.dart';

AppBar appAppbar({
  bool showBackButton = true,
  bool showInfo = true,
  VoidCallback? onBackPressed,
}) {
  return AppBar(
    centerTitle: true,
    actions: [
      if (showInfo)
        Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(InfoScreen()));
              },
              icon: const Icon(
                Icons.info,
                color: AppColors.primaryColor,
              ));
        })
    ],
    backgroundColor: AppColors.secondaryColor,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: AppColors.primaryColor),
            onPressed: onBackPressed,
          )
        : const SizedBox(),
    title: SizedBox(
      width: 150,
      child: Image.asset(AppAssets.applogo),
    ),
  );
}
