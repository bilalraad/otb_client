import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../view/utils/enums.dart';

class FlightDetails extends Equatable {
  const FlightDetails({
    required this.date,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arriveTime,
  });

  final DateTime date;
  final AirportCode from;
  final AirportCode to;
  final TimeOfDay departureTime;
  final TimeOfDay arriveTime;

  FlightDetails copyWith({
    DateTime? date,
    AirportCode? from,
    AirportCode? to,
    TimeOfDay? departureTime,
    TimeOfDay? arriveTime,
  }) =>
      FlightDetails(
        date: date ?? this.date,
        from: from ?? this.from,
        to: to ?? this.to,
        departureTime: departureTime ?? this.departureTime,
        arriveTime: arriveTime ?? this.arriveTime,
      );

  factory FlightDetails.fromMap(Map<String, dynamic> json) {
    return FlightDetails(
      date: DateTime.parse(json["date"]),
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
        "from": describeEnum(from),
        "to": describeEnum(to),
        "departureTime": DateTime(date.year, date.month, date.day,
                departureTime.hour, departureTime.minute)
            .toIso8601String(),
        "arriveTime": DateTime(date.year, date.month, date.day, arriveTime.hour,
                arriveTime.minute)
            .toIso8601String(),
      };

  @override
  List<Object?> get props => [date, from, to, departureTime, arriveTime];

  @override
  bool get stringify => true;
}
