import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otb_client/src/bloc/search_query/search_query_bloc.dart';

import 'package:otb_client/src/localization/app_localizations.dart';
import 'package:otb_client/src/view/utils/app_appbar.dart';
import 'package:otb_client/src/view/utils/app_assets.dart';
import 'package:otb_client/src/view/utils/app_text_styles.dart';

class TripsQueryResultPage extends StatelessWidget {
  const TripsQueryResultPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(),
      body: BlocConsumer<SearchQueryBloc, SearchQueryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is SearchQueryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchQueryWaitingForResponse) {
            return const WaitingForResponseWidget();
          } else if (state is SearchQueryError) {
            return const WaitingForResponseWidget();
          } else {
            return WaitingForResponseWidget();
          }
        },
      ),
    );
  }
}

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
          Text(appLoc.mightTakeFiveToFifteen,
              style: AppTextStyles.subHeaderStyle()),
          Text(appLoc.youllBeNotified, style: AppTextStyles.body()),
        ],
      ),
    );
  }
}
