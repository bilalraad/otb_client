import 'package:otb_client/src/data/models/travelers.dart';

class TripsQuery {
  TripsQuery({
    required this.queryId,
    required this.userDeviceToken,
    required this.tripCategory,
    required this.type,
    required this.departureCity,
    required this.arriveCity,
    required this.leaveDate,
    this.returnDate,
    required this.travelers,
    required this.airLines,
  });

  final String queryId;
  final String userDeviceToken;
  final String tripCategory;
  final String type;
  final String departureCity;
  final String arriveCity;
  final String leaveDate;
  final String? returnDate;
  final Travelers travelers;
  final List<String> airLines;

  TripsQuery copyWith({
    String? queryId,
    String? userDeviceToken,
    String? tripCategory,
    String? type,
    String? departureCity,
    String? arriveCity,
    String? leaveDate,
    String? returnDate,
    Travelers? travelers,
    List<String>? airLines,
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

  factory TripsQuery.fromMap(Map<String, dynamic> json) => TripsQuery(
        queryId: json["queryId"],
        userDeviceToken: json["userDeviceToken"],
        tripCategory: json["tripCategory"],
        type: json["type"],
        departureCity: json["departureCity"],
        arriveCity: json["arriveCity"],
        leaveDate: json["leaveDate"],
        returnDate: json["ReturnDate"],
        travelers: Travelers.fromMap(json["travelers"]),
        airLines: List<String>.from(json["airLines"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "queryId": queryId,
        "userDeviceToken": userDeviceToken,
        "tripCategory": tripCategory,
        "type": type,
        "departureCity": departureCity,
        "arriveCity": arriveCity,
        "leaveDate": leaveDate,
        "ReturnDate": returnDate,
        "travelers": travelers.toMap(),
        "airLines": List<dynamic>.from(airLines.map((x) => x)),
      };
}
