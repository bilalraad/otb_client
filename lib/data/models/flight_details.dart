class FlightDetails {
  FlightDetails({
    required this.date,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.arriveTime,
  });

  final String date;
  final String from;
  final String to;
  final String departureTime;
  final String arriveTime;

  FlightDetails copyWith({
    String? date,
    String? from,
    String? to,
    String? departureTime,
    String? arriveTime,
  }) =>
      FlightDetails(
        date: date ?? this.date,
        from: from ?? this.from,
        to: to ?? this.to,
        departureTime: departureTime ?? this.departureTime,
        arriveTime: arriveTime ?? this.arriveTime,
      );

  factory FlightDetails.fromMap(Map<String, dynamic> json) => FlightDetails(
        date: json["date"],
        from: json["from"],
        to: json["to"],
        departureTime: json["departure_time"],
        arriveTime: json["arrive_time"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "from": from,
        "to": to,
        "departure_time": departureTime,
        "arrive_time": arriveTime,
      };
}
