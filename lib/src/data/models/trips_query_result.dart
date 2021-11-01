// import 'package:equatable/equatable.dart';

// import 'trip.dart';

// class TripsQueryResult extends Equatable {
//   const TripsQueryResult({
//     required this.qureyId,
//     required this.resultItems,
//   });

//   final String qureyId;
//   final List<Trip> resultItems;

//   TripsQueryResult copyWith({
//     String? qureyId,
//     List<Trip>? resultItems,
//   }) =>
//       TripsQueryResult(
//         qureyId: qureyId ?? this.qureyId,
//         resultItems: resultItems ?? this.resultItems,
//       );

//   factory TripsQueryResult.fromMap(Map<String, dynamic> json) =>
//       TripsQueryResult(
//         qureyId: json["id"],
//         resultItems:
//             List<Trip>.from(json["resultItems"].map((x) => Trip.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": qureyId,
//         "resultItems":
//             List<Map<String, dynamic>>.from(resultItems.map((x) => x.toMap())),
//       };

//   @override
//   List<Object?> get props => [qureyId, resultItems];

//   @override
//   bool get stringify => true;
// }
