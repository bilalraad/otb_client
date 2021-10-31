import 'package:flutter/material.dart';
import '../../../../../localization/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_functions.dart';
import '../../../../utils/app_text_styles.dart';

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
        //TODO: GET THE ACTUALL LOCATION
        //TODO: GET LOCATION IMAGE
        //TODO: Test THIS MORE
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
