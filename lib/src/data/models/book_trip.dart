import 'package:flutter/foundation.dart';

import 'trip.dart';
import '../../view/utils/enums.dart';

class BookTrip {
  BookTrip({
    required this.clientName,
    required this.clientPhoneNumber,
    required this.address,
    required this.paymentMethod,
    required this.selectedTrip,
  });

  final String clientName;
  final String clientPhoneNumber;
  final String? address;
  final PaymentType paymentMethod;
  final Trip selectedTrip;

  BookTrip copyWith({
    String? clientName,
    String? clientPhoneNumber,
    String? address,
    PaymentType? paymentMethod,
    Trip? selectedTrip,
  }) =>
      BookTrip(
          clientName: clientName ?? this.clientName,
          clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
          address: address ?? this.address,
          paymentMethod: paymentMethod ?? this.paymentMethod,
          selectedTrip: selectedTrip ?? this.selectedTrip);

  factory BookTrip.fromMap(Map<String, dynamic> json) => BookTrip(
      clientName: json["clientName"],
      clientPhoneNumber: json["ClientPhoneNumber"],
      address: json["Address"],
      paymentMethod: PaymentType.values
          .firstWhere((pm) => describeEnum(pm) == json["paymentMethod"]),
      selectedTrip: Trip.fromMap(json["selectedTrip"]));

  Map<String, dynamic> toMap() => {
        "clientName": clientName,
        "ClientPhoneNumber": clientPhoneNumber,
        "Address": address,
        "paymentMethod": describeEnum(paymentMethod),
        "paymentConfirmed": false,
        "selectedTrip": selectedTrip.toMap(),
      };

  @override
  String toString() {
    return 'BookTrip(clientName: $clientName, clientPhoneNumber: $clientPhoneNumber, address: $address, paymentMethod: $paymentMethod, selectedTrip: $selectedTrip)';
  }
}
