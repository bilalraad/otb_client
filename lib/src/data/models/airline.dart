import 'dart:convert';

class AireLine {
  final String name;
  final String logo;
  final String code;

  const AireLine(this.name, this.logo, this.code);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'code': code,
    };
  }

  factory AireLine.fromMap(Map<String, dynamic> map) {
    return AireLine(
      map['name'],
      map['logo'],
      map['code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AireLine.fromJson(String source) =>
      AireLine.fromMap(json.decode(source));
}
