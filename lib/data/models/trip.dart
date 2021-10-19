import 'flight_details.dart';

class Trip {
  Trip({
    required this.tripNumber,
    required this.type,
    required this.airline,
    required this.leaving,
    required this.returning,
  });

  final String tripNumber;
  final String type;
  final String airline;
  final FlightDetails leaving;
  final FlightDetails returning;

  Trip copyWith({
    String? tripNumber,
    String? type,
    String? airline,
    FlightDetails? leaving,
    FlightDetails? returning,
  }) =>
      Trip(
        tripNumber: tripNumber ?? this.tripNumber,
        type: type ?? this.type,
        airline: airline ?? this.airline,
        leaving: leaving ?? this.leaving,
        returning: returning ?? this.returning,
      );

  factory Trip.fromMap(Map<String, dynamic> json) => Trip(
        tripNumber: json["trip_number"],
        type: json["type"],
        airline: json["airline"],
        leaving: FlightDetails.fromMap(json["leaving"]),
        returning: FlightDetails.fromMap(json["return"]),
      );

  Map<String, dynamic> toMap() => {
        "trip_number": tripNumber,
        "type": type,
        "airline": airline,
        "leaving": leaving.toMap(),
        "return": returning.toMap(),
      };
}
