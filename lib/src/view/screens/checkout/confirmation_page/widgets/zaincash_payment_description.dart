import 'package:flutter/material.dart';
import '../../../../../localization/app_localizations.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_text_styles.dart';

class ZaincashPaymentDescription extends StatelessWidget {
  const ZaincashPaymentDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Text(appLoc.transferToThisNumber),
        Text(
          appLoc.contactNumber,
          style: AppTextStyles.headerStyle(),
          textAlign: TextAlign.center,
        ),
        Text(
          appLoc.youllGetaCallAfterPayemntConfirmed,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonTextStyle(
              color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 10),
        Text(
          appLoc.writeYourNumberInInfoSection,
          style: AppTextStyles.buttonTextStyle(color: Colors.red),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: Image.asset(AppAssets.zaincashInfoFeild),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        Text(appLoc.ifYouDidntHaveAWallet),
        const SizedBox(height: 20),
      ],
    );
  }
}
