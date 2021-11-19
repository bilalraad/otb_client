import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../view/utils/enums.dart';
import 'flight_details.dart';
import './travelers.dart';

class Trip extends Equatable {
  const Trip({
    required this.type,
    required this.airline,
    required this.leaving,
    required this.returning,
    required this.price,
    required this.totalCost,
    required this.category,
    required this.travelers,
  });

  final TripType type;
  final Airline airline;
  final FlightDetails leaving;
  final FlightDetails? returning;
  final double price;
  final double totalCost;
  final TripCategory category;
  final Travelers travelers;

  Trip copyWith(
          {TripType? type,
          Airline? airline,
          FlightDetails? leaving,
          FlightDetails? returning,
          double? price,
          TripCategory? category,
          Travelers? travelers,
          double? totalCost}) =>
      Trip(
          type: type ?? this.type,
          category: category ?? this.category,
          airline: airline ?? this.airline,
          leaving: leaving ?? this.leaving,
          returning: returning ?? this.returning,
          price: price ?? this.price,
          travelers: travelers ?? this.travelers,
          totalCost: totalCost ?? this.totalCost);

  factory Trip.fromMap(Map<String, dynamic> json) {
    return Trip(
      type:
          TripType.values.firstWhere((ty) => describeEnum(ty) == json["type"]),
      airline: Airline.values
          .firstWhere((al) => describeEnum(al) == json["airline"]),
      leaving: FlightDetails.fromMap(json["leaving"]),
      returning:
          json["return"] != null ? FlightDetails.fromMap(json["return"]) : null,
      price: json['price'],
      totalCost: json['totalCost'],
      travelers: Travelers.fromMap(json['travelers']),
      category: TripCategory.values
          .firstWhere((tc) => describeEnum(tc) == json["category"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "type": describeEnum(type),
        "airline": describeEnum(airline),
        "leaving": leaving.toMap(),
        "return": returning?.toMap(),
        "price": price,
        "totalCost": totalCost,
        "category": describeEnum(category),
        "travelers": travelers.toMap(),
      };

  @override
  List<Object?> get props => [
        type,
        airline,
        leaving,
        returning,
        price,
        totalCost,
        category,
        travelers,
      ];

  @override
  bool get stringify => true;
}
