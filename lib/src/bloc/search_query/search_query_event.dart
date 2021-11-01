part of 'search_query_bloc.dart';

@immutable
abstract class SearchQueryEvent extends Equatable {}

class QuerySubmitted extends SearchQueryEvent {
  final TripsQuery query;

  QuerySubmitted(this.query);

  @override
  List<Object?> get props => [query];
}

class QueryResultStreamError extends SearchQueryEvent {
  final String error;
  final String queryId;

  QueryResultStreamError(this.error, this.queryId);

  @override
  List<Object?> get props => [error];
}

class QueryResultStreamRetry extends SearchQueryEvent {
  final String queryId;

  QueryResultStreamRetry(this.queryId);

  @override
  List<Object?> get props => [queryId];
}

class ResponseRecieved extends SearchQueryEvent {
  final List<Trip> response;

  ResponseRecieved(this.response);
  @override
  List<Object?> get props => [response];
}
