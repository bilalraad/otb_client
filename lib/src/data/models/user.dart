import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? name;
  final String? phoneNumber;
  final String deviceToken;
  final String? address;

  const AppUser({
    this.name,
    this.phoneNumber,
    required this.deviceToken,
    this.address,
  });

  static const initial = AppUser(deviceToken: '');

  AppUser copyWith({
    String? name,
    String? phoneNumber,
    String? deviceToken,
    String? address,
  }) {
    return AppUser(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deviceToken: deviceToken ?? this.deviceToken,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'deviceToken': deviceToken,
      'address': address,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'],
      deviceToken: map['deviceToken'],
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, phoneNumber, deviceToken, address];

  @override
  bool get stringify => true;
}
