import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../data/API/search_query_service.dart';
import '../../data/models/trips_query.dart';
import '../../data/models/trips_query_result.dart';

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
    on<QueryResultStreamError>((event, emit) {
      emit(SearchQueryStreamError(event.error, event.queryId));
    });
    on<QueryResultStreamRetry>((event, emit) {
      emit(SearchQueryWaitingForResponse(event.queryId));
      monitorQueryResults(event.queryId);
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
      emit(SearchQuerySendingError(e.toString(), event.query));
    }
  }

  void monitorQueryResults(String queryId) {
    resultsStreamSubscription?.cancel();
    resultsStreamSubscription =
        queryService.getTripsResult(queryId).listen((event) {
      add(ResponseRecieved(event));
    })
          ..onError((e) {
            add(QueryResultStreamError(e.toString(), queryId));
          });
  }

  @override
  Future<void> close() {
    resultsStreamSubscription?.cancel();
    return super.close();
  }
}
