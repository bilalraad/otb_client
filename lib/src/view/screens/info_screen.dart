import 'package:flutter/material.dart';

import '../../localization/app_localizations.dart';
import '../utils/utils.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: appAppbar(
          showInfo: false,
          onBackPressed: () {
            Navigator.of(context).pop();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                appLoc.whoAreWe,
                style: AppTextStyles.headerStyle(),
              ),
              const SizedBox(height: 10),
              Text(
                appLoc.aboutUs,
                style: AppTextStyles.subHeaderStyle(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  appLoc.ifYouHaveAnyQuestion,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: AppButton(
                  onPressed: () {
                    launchWhatsApp();
                  },
                  text: "\t\t\t" + appLoc.contactNumber,
                  icon: SizedBox(
                    width: 25,
                    child: Image.asset(AppAssets.whatsappIcon),
                  ),
                  buttonType: ButtonType.secondary,
                ),
              ),
              const SizedBox(height: 10),
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
          ),
        ),
      ),
    );
  }
}
