import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:otb_client/src/data/API/search_query_service.dart';
import 'package:otb_client/src/data/models/trips_query.dart';
import 'package:otb_client/src/data/models/trips_query_result.dart';

part 'search_query_event.dart';
part 'search_query_state.dart';

class SearchQueryBloc extends Bloc<SearchQueryEvent, SearchQueryState> {
  final BaseTripsQueryService queryService;
  StreamSubscription? resultsStreamSubscription;

  SearchQueryBloc(this.queryService) : super(SearchQueryInitial()) {
    on<QuerySubmitted>(_onQuerySubmitted);
    on<ResponseRecieved>((event, emit) {
      emit(SearchQueryResponseRecived(event.response));
    });
  }

  Future<void> _onQuerySubmitted(
      QuerySubmitted event, Emitter<SearchQueryState> emit) async {
    try {
      emit(SearchQueryLoading());
      await queryService.sendTripsQuery(event.query);
      emit(SearchQueryWaitingForResponse(event.query.queryId));
      monitorQueryResults(event.query.queryId);
    } catch (e) {
      emit(SearchQueryError(e.toString()));
    }
  }

  void monitorQueryResults(String queryId) {
    resultsStreamSubscription =
        queryService.getTripsResult(queryId).listen((event) {
      add(ResponseRecieved(event));
    })
          ..onError((e) {
            add(QueryError(e.toString()));
          });
  }

  @override
  Future<void> close() {
    resultsStreamSubscription?.cancel();
    return super.close();
  }
}
