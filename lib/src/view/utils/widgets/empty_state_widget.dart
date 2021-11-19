import 'package:flutter/material.dart';
import '../../../localization/app_localizations.dart';
import '../utils.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 250,
              child: Image.asset(AppAssets.emptyState),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            appLoc.theresNoItemsHere,
            style: AppTextStyles.subHeaderStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
