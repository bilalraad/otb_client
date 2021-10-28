part of 'search_query_bloc.dart';

@immutable
abstract class SearchQueryState extends Equatable {}

class SearchQueryInitial extends SearchQueryState {
  @override
  List<Object?> get props => [];
}

class SearchQuerySendingError extends SearchQueryState {
  final String error;
  final TripsQuery query;

  SearchQuerySendingError(this.error, this.query);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'SearchQueryError(error: $error)';
}

class SearchQueryStreamError extends SearchQueryState {
  final String error;
  final String queryId;

  SearchQueryStreamError(this.error, this.queryId);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'SearchQueryError(error: $error)';
}

class SearchQueryLoading extends SearchQueryState {
  @override
  List<Object?> get props => [];
}

class SearchQueryWaitingForResponse extends SearchQueryState {
  final String queryId;

  SearchQueryWaitingForResponse(this.queryId);
  @override
  List<Object?> get props => [queryId];

  @override
  String toString() => 'SearchQueryWaitingForResponse(queryId: $queryId)';
}

class SearchQueryResponseRecived extends SearchQueryState {
  final TripsQueryResult trips;
  SearchQueryResponseRecived(this.trips);

  @override
  List<Object?> get props => [trips];

  @override
  String toString() => 'SearchQueryResponseRecived(trips: $trips)';
}
