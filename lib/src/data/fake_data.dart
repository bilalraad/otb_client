import 'package:flutter/foundation.dart';
import '../view/utils/enums.dart';

final searchResult = {
  'id': '77bfjbfjb876kjhkj',
  'resultItems': [
    {
      "price": 1500.0,
      "totalCost": 1900.0,
      "type": describeEnum(TripType.round),
      "category": describeEnum(TripCategory.economic),
      "airline": describeEnum(Airline.IAW),
      "travelers": {"adults": 1, "kids": 0, "infants": 0},
      "leaving": {
        "flightNumber": "A-12",
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.DAM),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
      "return": {
        "flightNumber": "A-12",
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
      "price": 1500.0,
      "totalCost": 1900.0,
      "category": describeEnum(TripCategory.economic),
      "type": describeEnum(TripType.round),
      "airline": describeEnum(Airline.IAW),
      "travelers": {"adults": 1, "kids": 0, "infants": 0},
      "leaving": {
        "flightNumber": "A-12",
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": describeEnum(AirportCode.BGW),
        "to": describeEnum(AirportCode.BEY),
        "departureTime": DateTime.now().toIso8601String(),
        "arriveTime": DateTime.now()
            .add(const Duration(hours: 24, minutes: 10))
            .toIso8601String(),
      },
      "return": {
        "flightNumber": "A-12",
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

final searchQueries = {
  'searchQueries': [
    searchQueryOneway,
    searchQueryRound,
  ]
};

final searchResultOneWay = {
  'id': '77bfjbfjb876kjhkj',
  'resultItems': [
    {
      "price": 1500.0,
      "totalCost": 1900.0,
      "category": describeEnum(TripCategory.economic),
      "type": describeEnum(TripType.oneWay),
      "airline": describeEnum(Airline.IAW),
      "travelers": {"adults": 1, "kids": 0, "infants": 0},
      "leaving": {
        "flightNumber": "A-12",
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
      "price": 1500.0,
      "totalCost": 1900.0,
      "category": describeEnum(TripCategory.economic),
      "type": describeEnum(TripType.oneWay),
      "airline": describeEnum(Airline.IAW),
      "travelers": {"adults": 1, "kids": 0, "infants": 0},
      "leaving": {
        "flightNumber": "A-12",
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

final searchQueryOneway = {
  "queryId": "OIUIOIU8798YS98Y9",
  "userDeviceToken": "ADASDASDDQWDQDQWDQWW",
  "tripCategory": describeEnum(TripCategory.economic),
  "type": describeEnum(TripType.oneWay),
  "departureCity": describeEnum(AirportCode.BGW),
  "arriveCity": describeEnum(AirportCode.AMM),
  "leaveDate": DateTime.now().toIso8601String(),
  "returnDate": null,
  "answeredByAdmin": false,
  "travelers": {"adults": 1, "kids": 0, "infants": 0},
  "airLines": [
    describeEnum(Airline.FBA),
    describeEnum(Airline.SAW),
  ],
};

final searchQueryRound = {
  "queryId": "OIUIOIU8798YS98Y9",
  "userDeviceToken": "ADASDASDDQWDQDQWDQWW",
  "tripCategory": describeEnum(TripCategory.economic),
  "type": describeEnum(TripType.round),
  "departureCity": describeEnum(AirportCode.BGW),
  "arriveCity": describeEnum(AirportCode.AMM),
  "leaveDate": DateTime.now().toIso8601String(),
  "returnDate": DateTime.now().add(const Duration(days: 2)).toIso8601String(),
  "travelers": {"adults": 2, "kids": 0, "infants": 0},
  "answeredByAdmin": false,
  "airLines": [
    describeEnum(Airline.IAW),
    describeEnum(Airline.SAW),
  ],
};

final fakeTrip = {
  "price": 1500.0,
  "totalCost": 1900.0,
  "category": describeEnum(TripCategory.economic),
  "type": describeEnum(TripType.round),
  "airline": describeEnum(Airline.IAW),
  "leaving": {
    "flightNumber": "A-12",
    "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
    "from": describeEnum(AirportCode.BGW),
    "to": describeEnum(AirportCode.BEY),
    "departureTime": DateTime.now().toIso8601String(),
    "arriveTime": DateTime.now()
        .add(const Duration(hours: 24, minutes: 10))
        .toIso8601String(),
  },
  "return": {
    "flightNumber": "A-12",
    "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
    "from": describeEnum(AirportCode.BEY),
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
