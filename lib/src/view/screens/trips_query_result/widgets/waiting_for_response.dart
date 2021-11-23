import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/utils.dart';
import '../../../../localization/app_localizations.dart';

class WaitingForResponseWidget extends StatelessWidget {
  const WaitingForResponseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appLoc.pleaseWait, style: AppTextStyles.headerStyle()),
          Text(appLoc.searchingTripsForYou,
              style: AppTextStyles.subHeaderStyle()),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(AppAssets.waiting),
          ),
          const SizedBox(height: 20),
          SpinKitFadingCube(color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 20),
          Text(appLoc.mightTakeFiveToFifteen,
              style: AppTextStyles.subHeaderStyle()),
          Text(appLoc.youllBeNotified, style: AppTextStyles.body()),
        ],
      ),
    );
  }
}
