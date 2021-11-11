import 'package:flutter/foundation.dart';
import '../view/utils/enums.dart';

final searchResult = {
  'id': '77bfjbfjb876kjhkj',
  'resultItems': [
    {
      "tripNumber": "A-12",
      "price": 1500.0,
      "totalCost": 1900.0,
      "type": describeEnum(TripType.round),
      "airline": describeEnum(Airline.IAW),
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.DAM),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
      "return": {
        "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
        "from": describeEnum(AirportCode.DAM),
        "to": describeEnum(AirportCode.BGW),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      }
    },
    {
      "tripNumber": "A-13",
      "price": 1500.0,
      "totalCost": 1900.0,
      "type": describeEnum(TripType.round),
      "airline": describeEnum(Airline.IAW),
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.BEY),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
      "return": {
        "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
        "from": describeEnum(AirportCode.BEY),
        "to": describeEnum(AirportCode.BGW),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      }
    }
  ]
};

final searchResultOneWay = {
  'id': '77bfjbfjb876kjhkj',
  'resultItems': [
    {
      "tripNumber": "A-12",
      "price": 1500.0,
      "totalCost": 1900.0,
      "type": describeEnum(TripType.oneWay),
      "airline": describeEnum(Airline.IAW),
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.DAM),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
    },
    {
      "tripNumber": "A-13",
      "price": 1500.0,
      "totalCost": 1900.0,
      "type": describeEnum(TripType.oneWay),
      "airline": describeEnum(Airline.IAW),
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.BEY),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
    }
  ]
};

final searchQuery = {
  "queryId": "OIUIOIU8798YS98Y9",
  "userDeviceToken": "ADASDASDDQWDQDQWDQWW",
  "tripCategory": describeEnum(TripCategory.economic),
  "type": describeEnum(TripType.oneWay),
  "departureCity": describeEnum(AirportCode.BGW),
  "arriveCity": describeEnum(AirportCode.AMM),
  "leaveDate": DateTime.now().toIso8601String(),
  "returnDate": "",
  "travelers": {"adults": 1, "kids": 0, "infants": 0},
  "airLines": [
    describeEnum(Airline.FBA),
    describeEnum(Airline.SAW),
  ],
};

final fakeTrip = {
  "tripNumber": "A-12",
  "price": 1500.0,
  "totalCost": 1900.0,
  "type": describeEnum(TripType.round),
  "airline": describeEnum(Airline.IAW),
  "leaving": {
    "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
    "from": describeEnum(AirportCode.BGW),
    "to": describeEnum(AirportCode.DAM),
    "departureTime": DateTime.now().toIso8601String(),
    "arriveTime": DateTime.now()
        .add(const Duration(hours: 24, minutes: 10))
        .toIso8601String(),
  },
  "return": {
    "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
    "from": describeEnum(AirportCode.DAM),
    "to": describeEnum(AirportCode.BGW),
    "departureTime": DateTime.now().toIso8601String(),
    "arriveTime": DateTime.now()
        .add(const Duration(hours: 24, minutes: 10))
        .toIso8601String(),
  }
};

final confirmBooking = {
  "clientName": "",
  "ClientPhoneNumber": "",
  "Address": "",
  "paymentMethod": "",
  "paymentConfirmed": "",
};

// final fakeQuery = TripsQuery(
//   queryId: "OIUIOIU8798YS98Y9",
//   userDeviceToken: "ADASDASDDQWDQDQWDQWW",
//   tripCategory: "VIP",
//   type: "oneway",
//   departureCity: "BGW",
//   arriveCity: "AMM",
//   leaveDate: "",
//   travelers: Travelers(adults: 1),
//   airLines: [
//     'THY',
//     'IAW',
//   ],
// );
