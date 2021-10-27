part of 'search_query_bloc.dart';

@immutable
abstract class SearchQueryEvent extends Equatable {}

class QuerySubmitted extends SearchQueryEvent {
  final TripsQuery query;

  QuerySubmitted(this.query);

  @override
  List<Object?> get props => [query];
}

class QueryStreamError extends SearchQueryEvent {
  final String error;

  QueryStreamError(this.error);

  @override
  List<Object?> get props => [error];
}

class ResponseRecieved extends SearchQueryEvent {
  final TripsQueryResult response;

  ResponseRecieved(this.response);
  @override
  List<Object?> get props => [response];
}
