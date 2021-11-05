part of 'search_query_bloc.dart';

@immutable
abstract class SearchQueryState extends Equatable {
  Map<String, dynamic> toMap();
}

class SearchQueryInitial extends SearchQueryState {
  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toMap() => {};
}

class SearchQuerySendingError extends SearchQueryState {
  final String error;
  final TripsQuery query;

  SearchQuerySendingError(this.error, this.query);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'SearchQueryError(error: $error)';

  @override
  Map<String, dynamic> toMap() => {};
}

class SearchQueryStreamError extends SearchQueryState {
  final String error;
  final String queryId;

  SearchQueryStreamError(this.error, this.queryId);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'SearchQueryError(error: $error)';

  @override
  Map<String, dynamic> toMap() => {};
}

class SearchQueryLoading extends SearchQueryState {
  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toMap() => {};
}

class SearchQueryWaitingForResponse extends SearchQueryState {
  final String queryId;

  SearchQueryWaitingForResponse(this.queryId);
  @override
  List<Object?> get props => [queryId];

  @override
  String toString() => 'SearchQueryWaitingForResponse(queryId: $queryId)';

  @override
  Map<String, dynamic> toMap() {
    return {'queryId': queryId};
  }

  factory SearchQueryWaitingForResponse.fromMap(Map<String, dynamic> map) {
    return SearchQueryWaitingForResponse(map['queryId']);
  }
}

class SearchQueryResponseRecived extends SearchQueryState {
  final List<Trip> trips;
  SearchQueryResponseRecived(this.trips);

  @override
  List<Object?> get props => [trips];

  @override
  String toString() => 'SearchQueryResponseRecived(trips: $trips)';

  @override
  Map<String, dynamic> toMap() => {};
}
