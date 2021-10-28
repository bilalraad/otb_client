import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../view/utils/enums.dart';
import 'flight_details.dart';

class Trip extends Equatable {
  const Trip({
    required this.tripNumber,
    required this.type,
    required this.airline,
    required this.leaving,
    required this.returning,
    required this.price,
    required this.totalCost,
  });

  final String tripNumber;
  final TripType type;
  final Airline airline;
  final FlightDetails leaving;
  final FlightDetails returning;
  final double price;
  final double totalCost;

  Trip copyWith(
          {String? tripNumber,
          TripType? type,
          Airline? airline,
          FlightDetails? leaving,
          FlightDetails? returning,
          double? price,
          double? totalCost}) =>
      Trip(
          tripNumber: tripNumber ?? this.tripNumber,
          type: type ?? this.type,
          airline: airline ?? this.airline,
          leaving: leaving ?? this.leaving,
          returning: returning ?? this.returning,
          price: price ?? this.price,
          totalCost: totalCost ?? this.totalCost);

  factory Trip.fromMap(Map<String, dynamic> json) {
    print(json);
    return Trip(
      tripNumber: json["tripNumber"],
      type:
          TripType.values.firstWhere((ty) => describeEnum(ty) == json["type"]),
      airline: Airline.values
          .firstWhere((al) => describeEnum(al) == json["airline"]),
      leaving: FlightDetails.fromMap(json["leaving"]),
      returning: FlightDetails.fromMap(json["return"]),
      price: json['price'],
      totalCost: json['totalCost'],
    );
  }

  Map<String, dynamic> toMap() => {
        "tripNumber": tripNumber,
        "type": describeEnum(type),
        "airline": describeEnum(airline),
        "leaving": leaving.toMap(),
        "return": returning.toMap(),
        "price": price,
        "totalCost": totalCost,
      };

  @override
  List<Object?> get props =>
      [tripNumber, type, airline, leaving, returning, price, totalCost];

  @override
  bool get stringify => true;
}
