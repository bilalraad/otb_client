class BookTrip {
  BookTrip({
    required this.clientName,
    required this.clientPhoneNumber,
    required this.address,
    required this.paymentMethod,
  });

  final String clientName;
  final String clientPhoneNumber;
  final String address;
  final String paymentMethod;

  BookTrip copyWith({
    String? clientName,
    String? clientPhoneNumber,
    String? address,
    String? paymentMethod,
  }) =>
      BookTrip(
        clientName: clientName ?? this.clientName,
        clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
        address: address ?? this.address,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );

  factory BookTrip.fromMap(Map<String, dynamic> json) => BookTrip(
        clientName: json["clientName"],
        clientPhoneNumber: json["ClientPhoneNumber"],
        address: json["Address"],
        paymentMethod: json["paymentMethod"],
      );

  Map<String, dynamic> toMap() => {
        "clientName": clientName,
        "ClientPhoneNumber": clientPhoneNumber,
        "Address": address,
        "paymentMethod": paymentMethod,
        "paymentConfirmed": false,
      };
}
