import 'package:flutter/material.dart';
import '../../../../localization/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_button.dart';
import '../../../utils/app_text_styles.dart';

class DisplayError extends StatelessWidget {
  final String error;
  final String title;
  final VoidCallback? onRetry;
  const DisplayError({
    Key? key,
    required this.error,
    this.onRetry,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.headerStyle(),
          ),
          Text(appLoc.checkInternet),
          Text(
            'Error: ' + error,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(AppAssets.queryError),
          ),
          const SizedBox(height: 20),
          Visibility(
              visible: onRetry != null,
              child: AppButton(
                buttonType: ButtonType.secondary,
                width: MediaQuery.of(context).size.width / 2,
                onPressed: onRetry!,
                text: appLoc.tryAgain,
              ))
        ],
      ),
    );
  }
}
