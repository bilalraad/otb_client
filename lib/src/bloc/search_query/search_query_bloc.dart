import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/trip.dart';
import '../../data/API/search_query_service.dart';
import '../../data/models/trips_query.dart';
part 'search_query_event.dart';
part 'search_query_state.dart';

class TripsQueryBloc extends Bloc<SearchQueryEvent, SearchQueryState> {
  final BaseTripsQueryService _queryService;
  StreamSubscription? _resultsStreamSubscription;

  TripsQueryBloc(this._queryService) : super(SearchQueryInitial()) {
    on<QuerySubmitted>(_onQuerySubmitted);
    on<ResponseRecieved>((event, emit) {
      emit(SearchQueryResponseRecived(event.response));
    });
    on<QueryResultStreamError>((event, emit) {
      emit(SearchQueryStreamError(event.error, event.queryId));
    });
    on<QueryResultStreamRetry>((event, emit) {
      emit(SearchQueryLoading());
      emit(SearchQueryWaitingForResponse(event.queryId));
      monitorQueryResults(event.queryId);
    });
  }

  Future<void> _onQuerySubmitted(
      QuerySubmitted event, Emitter<SearchQueryState> emit) async {
    try {
      emit(SearchQueryLoading());
      await _queryService.sendTripsQuery(event.query);
      emit(SearchQueryWaitingForResponse(event.query.queryId));
      monitorQueryResults(event.query.queryId);
    } catch (e) {
      emit(SearchQuerySendingError(e.toString(), event.query));
    }
  }

  void monitorQueryResults(String queryId) {
    _resultsStreamSubscription?.cancel();
    _resultsStreamSubscription =
        _queryService.getTripsResult(queryId).listen((event) {
      if (event.isNotEmpty) add(ResponseRecieved(event));
    })
          ..onError((e) {
            add(QueryResultStreamError(e.toString(), queryId));
          });
  }

  @override
  Future<void> close() {
    _resultsStreamSubscription?.cancel();
    return super.close();
  }
}
