import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/utils.dart';

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
          textAlign: TextAlign.center,
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
