import 'package:entry/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home.dart';
import '../../utils/utils.dart';
import '../../../bloc/search_query/search_query_bloc.dart';
import '../../../localization/app_localizations.dart';
import 'widgets/display_error.dart';
import 'widgets/response_trip_item.dart';
import 'widgets/waiting_for_response.dart';

class TripsQueryResultPage extends StatefulWidget {
  const TripsQueryResultPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TripsQueryResultPage> createState() => _TripsQueryResultPageState();
}

class _TripsQueryResultPageState extends State<TripsQueryResultPage> {
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return BlocBuilder<TripsQueryBloc, SearchQueryState>(
      builder: (context, state) {
        return Scaffold(
            appBar: appAppbar(
              showInfo: false,
              onBackPressed: () {
                Navigator.of(context)
                    .pushReplacement(createRoute(const Home()));
              },
              showBackButton: (state is SearchQueryResponseRecived ||
                  state is SearchQuerySendingError),
            ),
            body: Builder(builder: (c) {
              if (state is SearchQueryLoading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state is SearchQueryWaitingForResponse) {
                return const Entry.scale(
                  delay: Duration(milliseconds: 500),
                  child: WaitingForResponseWidget(),
                );
              } else if (state is SearchQuerySendingError) {
                return Entry.scale(
                  delay: const Duration(milliseconds: 500),
                  child: DisplayError(
                    title: appLoc.errorWhileSending,
                    error: state.error,
                    onRetry: () {
                      context
                          .read<TripsQueryBloc>()
                          .add(QuerySubmitted(state.query));
                    },
                  ),
                );
              } else if (state is SearchQueryStreamError) {
                return Entry.scale(
                  delay: const Duration(milliseconds: 500),
                  child: DisplayError(
                    title: appLoc.unknownError,
                    error: state.error,
                    onRetry: () {
                      context
                          .read<TripsQueryBloc>()
                          .add(QueryResultStreamRetry(state.queryId));
                    },
                  ),
                );
              } else if (state is SearchQueryResponseRecived) {
                final result = state.trips;

                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appLoc.searchResults + ": ",
                          style: const TextStyle(
                              color: AppColors.inputFontColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          appLoc.from +
                              " " +
                              mapAirportCodeToName(
                                  result.first.leaving.from, appLoc) +
                              " " +
                              appLoc.to +
                              " " +
                              mapAirportCodeToName(
                                  result.first.leaving.to, appLoc) +
                              " - " +
                              describeEnum(result.first.type),
                          style:
                              AppTextStyles.body(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: result.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Entry.scale(
                              delay: const Duration(milliseconds: 500),
                              child: ResponseTripItem(trip: result[index]),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return const CupertinoActivityIndicator();
              }
            }));
      },
    );
  }
}
