class Travelers {
  Travelers({
    this.adults = 1,
    this.kids = 0,
    this.infants = 0,
  });

  final int adults;
  final int kids;
  final int infants;

  Travelers copyWith({
    int? adults,
    int? kids,
    int? infants,
  }) =>
      Travelers(
        adults: adults ?? this.adults,
        kids: kids ?? this.kids,
        infants: infants ?? this.infants,
      );

  factory Travelers.fromMap(Map<String, dynamic> json) {
    return Travelers(
      adults: json["adults"],
      kids: json["kids"],
      infants: json["infants"],
    );
  }

  Map<String, dynamic> toMap() => {
        "adults": adults,
        "kids": kids,
        "infants": infants,
      };

  @override
  String toString() =>
      'Travelers(adults: $adults, kids: $kids, infants: $infants)';
}
