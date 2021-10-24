import 'package:otb_client/src/view/utils/app_assets.dart';

import 'models/airline.dart';
import 'models/travelers.dart';
import 'models/trips_query.dart';

final searchResult = {
  'id': '77bfjbfjb876kjhkj',
  'resultItems': [
    {
      "trip_number": "A-12",
      "type": "round",
      "airline": "Fly Baghdad",
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": "BGW",
        "to": "DAM",
        "departure_time": "12:25",
        "arrive_time": "15:59"
      },
      "return": {
        "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
        "from": "DAM",
        "to": "BGW",
        "departure_time": "9:25",
        "arrive_time": "12:59"
      }
    },
    {
      "trip_number": "A-13",
      "type": "round",
      "airline": "Iraqi Airlines",
      "leaving": {
        "date": DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        "from": "BGW",
        "to": "SAW",
        "departure_time": "12:25",
        "arrive_time": "15:59"
      },
      "return": {
        "date": DateTime.now().add(const Duration(days: 10)).toIso8601String(),
        "from": "SAW",
        "to": "BGW",
        "departure_time": "9:25",
        "arrive_time": "12:59"
      }
    }
  ]
};

final searchQuery = {
  "queryId": "OIUIOIU8798YS98Y9",
  "userDeviceToken": "ADASDASDDQWDQDQWDQWW",
  "tripCategory": "VIP",
  "type": "oneway",
  "departureCity": "BGW",
  "arriveCity": "AMM",
  "leaveDate": "",
  "ReturnDate": "",
  "travelers": {"adults": 1, "kids": 0, "infants": 0},
  "airLines": [
    "iraqi airline",
    "fly baghdad",
  ],
};

final confirmBooking = {
  "clientName": "",
  "ClientPhoneNumber": "",
  "Address": "",
  "paymentMethod": "",
  "paymentConfirmed": "",
};

final fakeQuery = TripsQuery(
  queryId: "OIUIOIU8798YS98Y9",
  userDeviceToken: "ADASDASDDQWDQDQWDQWW",
  tripCategory: "VIP",
  type: "oneway",
  departureCity: "BGW",
  arriveCity: "AMM",
  leaveDate: "",
  travelers: Travelers(adults: 1),
  airLines: [
    'THY',
    'IAW',
  ],
);
