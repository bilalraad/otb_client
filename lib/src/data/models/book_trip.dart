import 'package:flutter/foundation.dart';
import 'package:otbclient/src/data/models/user.dart';

import 'trip.dart';
import '../../view/utils/enums.dart';

class BookTrip {
  BookTrip({
    required this.clientInfo,
    required this.paymentMethod,
    required this.selectedTrip,
  });

  final AppUser clientInfo;
  final PaymentType paymentMethod;
  final Trip selectedTrip;

  BookTrip copyWith({
    AppUser? clientInfo,
    PaymentType? paymentMethod,
    Trip? selectedTrip,
  }) =>
      BookTrip(
          clientInfo: clientInfo ?? this.clientInfo,
          paymentMethod: paymentMethod ?? this.paymentMethod,
          selectedTrip: selectedTrip ?? this.selectedTrip);

  factory BookTrip.fromMap(Map<String, dynamic> json) => BookTrip(
      clientInfo: AppUser.fromMap(json["clientInfo"]),
      paymentMethod: PaymentType.values
          .firstWhere((pm) => describeEnum(pm) == json["paymentMethod"]),
      selectedTrip: Trip.fromMap(json["selectedTrip"]));

  Map<String, dynamic> toMap() => {
        "clientInfo": clientInfo.toMap(),
        "paymentMethod": describeEnum(paymentMethod),
        "paymentConfirmed": false,
        "selectedTrip": selectedTrip.toMap(),
      };

  @override
  String toString() {
    return 'BookTrip(clientInfo: ${clientInfo.toString()}, paymentMethod: $paymentMethod, selectedTrip: $selectedTrip)';
  }
}
