import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../../../../localization/app_localizations.dart';

class DirectPaymentDescription extends StatelessWidget {
  const DirectPaymentDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 10),
        Text(appLoc.youllGetaCall),
        Text(
          appLoc.location,
          style: AppTextStyles.headerStyle(),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () async {
            await launchMap();
          },
          child: SizedBox(
            height: 200,
            child: Image.asset(AppAssets.officeLocation),
          ),
        ),
        Text(appLoc.pressImageToOpenMap),
      ],
    );
  }
}
