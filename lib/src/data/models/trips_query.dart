import 'package:flutter/foundation.dart';
import '../../view/utils/enums.dart';
import 'package:uuid/uuid.dart';

import 'travelers.dart';

class TripsQuery {
  TripsQuery({
    required this.queryId,
    required this.userDeviceToken,
    required this.tripCategory,
    required this.type,
    required this.departureCity,
    required this.arriveCity,
    this.leaveDate,
    this.returnDate,
    required this.travelers,
    required this.airLines,
  });

  final String queryId;
  final String userDeviceToken;
  final TripCategory tripCategory;
  final TripType type;
  final AirportCode? departureCity;
  final AirportCode? arriveCity;
  final DateTime? leaveDate;
  final DateTime? returnDate;
  final Travelers travelers;
  final List<Airline> airLines;

  TripsQuery copyWith({
    String? queryId,
    String? userDeviceToken,
    TripCategory? tripCategory,
    TripType? type,
    AirportCode? departureCity,
    AirportCode? arriveCity,
    DateTime? leaveDate,
    DateTime? returnDate,
    Travelers? travelers,
    List<Airline>? airLines,
  }) =>
      TripsQuery(
        queryId: queryId ?? this.queryId,
        userDeviceToken: userDeviceToken ?? this.userDeviceToken,
        tripCategory: tripCategory ?? this.tripCategory,
        type: type ?? this.type,
        departureCity: departureCity ?? this.departureCity,
        arriveCity: arriveCity ?? this.arriveCity,
        leaveDate: leaveDate ?? this.leaveDate,
        returnDate: returnDate ?? this.returnDate,
        travelers: travelers ?? this.travelers,
        airLines: airLines ?? this.airLines,
      );

  factory TripsQuery.fromMap(Map<String, dynamic> json) {
    List<Airline> airlines = [];

    for (var airline in json["airLines"]) {
      airlines
          .add(Airline.values.firstWhere((al) => describeEnum(al) == airline));
    }

    return TripsQuery(
      queryId: json["queryId"],
      userDeviceToken: json["userDeviceToken"],
      tripCategory: TripCategory.values
          .firstWhere((tc) => describeEnum(tc) == json["tripCategory"]),
      type:
          TripType.values.firstWhere((ty) => describeEnum(ty) == json["type"]),
      departureCity: AirportCode.values
          .firstWhere((ac) => describeEnum(ac) == json["departureCity"]),
      arriveCity: AirportCode.values
          .firstWhere((ac) => describeEnum(ac) == json["arriveCity"]),
      leaveDate: DateTime.parse(json["leaveDate"]),
      returnDate: DateTime.parse(json["returnDate"]),
      travelers: Travelers.fromMap(json["travelers"]),
      airLines: airlines,
    );
  }

  Map<String, dynamic> toMap() => {
        "queryId": queryId,
        "userDeviceToken": userDeviceToken,
        "tripCategory": describeEnum(tripCategory),
        "type": describeEnum(type),
        "departureCity": describeEnum(departureCity!),
        "arriveCity": describeEnum(arriveCity!),
        "leaveDate": leaveDate?.toIso8601String(),
        "returnDate": returnDate?.toIso8601String(),
        "travelers": travelers.toMap(),
        "airLines": List<dynamic>.from(airLines.map((x) => describeEnum(x))),
      };

  factory TripsQuery.initial() {
    return TripsQuery(
      queryId: const Uuid().v4(),
      userDeviceToken: '',
      tripCategory: TripCategory.economic,
      type: TripType.oneWay,
      departureCity: null,
      arriveCity: null,
      travelers: Travelers(adults: 1),
      airLines: [],
    );
  }

  @override
  String toString() {
    return 'TripsQuery(queryId: $queryId, userDeviceToken: $userDeviceToken, tripCategory: $tripCategory, type: $type, departureCity: $departureCity, arriveCity: $arriveCity, leaveDate: $leaveDate, returnDate: $returnDate, travelers: $travelers, airLines: $airLines)';
  }
}
