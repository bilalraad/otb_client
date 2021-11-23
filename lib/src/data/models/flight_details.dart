import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../view/utils/enums.dart';

extension DateTimeExtension on TimeOfDay {
  DateTime toDateTime([DateTime? wantedDate]) {
    final dt = wantedDate ?? DateTime.now();
    return DateTime(dt.year, dt.month, dt.day, hour, minute);
  }
}

class FlightDetails extends Equatable {
  const FlightDetails({
    required this.date,
    required this.from,
    required this.flightNumber,
    required this.to,
    this.departureTime,
    this.arriveTime,
  });

  final DateTime date;
  final AirportCode from;
  final AirportCode to;
  final TimeOfDay? departureTime;
  final TimeOfDay? arriveTime;
  final String flightNumber;

  FlightDetails copyWith({
    DateTime? date,
    String? flightNumber,
    AirportCode? from,
    AirportCode? to,
    TimeOfDay? departureTime,
    TimeOfDay? arriveTime,
  }) =>
      FlightDetails(
        date: date ?? this.date,
        from: from ?? this.from,
        to: to ?? this.to,
        flightNumber: flightNumber ?? this.flightNumber,
        departureTime: departureTime ?? this.departureTime,
        arriveTime: arriveTime ?? this.arriveTime,
      );

  factory FlightDetails.fromMap(Map<String, dynamic> json) {
    return FlightDetails(
      date: DateTime.parse(json["date"]),
      flightNumber: json['flightNumber'],
      from:
          AirportCode.values.firstWhere((a) => describeEnum(a) == json["from"]),
      to: AirportCode.values.firstWhere((a) => describeEnum(a) == json["to"]),
      departureTime:
          TimeOfDay.fromDateTime(DateTime.parse(json["departureTime"])),
      arriveTime: TimeOfDay.fromDateTime(DateTime.parse(json["arriveTime"])),
    );
  }

  Map<String, dynamic> toMap() => {
        "date": date.toIso8601String(),
        "flightNumber": flightNumber,
        "from": describeEnum(from),
        "to": describeEnum(to),
        "departureTime": departureTime!.toDateTime(date).toIso8601String(),
        "arriveTime": arriveTime!.toDateTime(date).toIso8601String(),
      };

  @override
  List<Object?> get props =>
      [date, from, to, departureTime, arriveTime, flightNumber];

  @override
  bool get stringify => true;
}
