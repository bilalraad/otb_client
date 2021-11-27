import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/trips_query.dart';
import './utils.dart';

void launchWhatsApp({
  int phone = 07730000231,
  TripsQuery? query,
}) async {
  String url() {
    if (Platform.isAndroid) {
      if (query == null) return 'https://wa.me/+964$phone';

      return "https://wa.me/+964$phone/?text=${tripQueryToWhatsAppMessage(query)}";
    } else {
      if (query == null) {
        return 'https://api.whatsapp.com/send?phone=+964$phone';
      }

      return "https://api.whatsapp.com/send?phone=+964$phone&text=${tripQueryToWhatsAppMessage(query)}";
    }
  }

  try {
    await launch(url());
  } catch (e, s) {
    logger(TripsQuery).e(e);
    logger(TripsQuery).e(s);
  }
}

Future<void> launchMap() async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=33.3205560,44.3541790';
  try {
    await launch(googleUrl);
  } catch (e) {
    logger(TripsQuery).e(e);
  }
}

String tripQueryToWhatsAppMessage(TripsQuery query) {
  List<String> airlines = [];
  for (var airline in query.airLines) {
    airlines.add(describeEnum(airline));
  }
  return ('اريد حجز رحلة من ${describeEnum(query.departureCity!)} الى ${describeEnum(query.arriveCity!)} \n'
      'نوع الرحلة: ${describeEnum(query.type)}\n'
      'فئة الرحلة: ${describeEnum(query.tripCategory)}\n\n'
      'موعد المغادرة: ${DateFormat('d/M/yy ,E').format(query.leaveDate!)}\n'
      'موعد العودة: ${query.returnDate == null ? 'لا يوجد' : DateFormat('d/M/yy ,E').format(query.returnDate!)}\n\n'
      'عدد المسافرين\n'
      'الكبار: ${query.travelers.adults}\n'
      'الاطفال: ${query.travelers.kids == 0 ? 'لايوجد' : query.travelers.kids}\n'
      'الرضع: ${query.travelers.infants == 0 ? 'لايوجد' : query.travelers.infants}\n\n'
      'الخطوط الجوية المحددة:\n$airlines');
}

String mapTripTypeToName(TripType type, AppLocalizations appLoc) {
  switch (type) {
    case TripType.oneWay:
      return appLoc.oneWay;
    default:
      return appLoc.round;
  }
}

void validateTripQuery(TripsQuery query, AppLocalizations appLoc) {
  if (query.departureCity == null) {
    throw appLoc.pleaseSelectDepartureCity;
  } else if (query.arriveCity == null) {
    throw appLoc.pleaseSelectArriveCity;
  } else if (query.leaveDate == null) {
    throw appLoc.pleaseSelectDepartureDate;
  } else if (query.type == TripType.round) {
    if (query.returnDate == null) {
      throw appLoc.pleaseSelectReturnDate;
    } else if (query.returnDate!
        .isBefore(query.leaveDate!.add(const Duration(days: 1)))) {
      throw appLoc.returnDateShouldBeAfterAtLeastOneDay;
    }
  }
}

/// This function will make special transition animation
/// if you want to change the effect then set the [curve] to watever u want
Route createRoute(Widget route, {Cubic curve = Curves.ease}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

String mapAirportCodeToName(AirportCode code, AppLocalizations appLoc) {
  switch (code) {
    case AirportCode.BGW:
      return appLoc.baghdad;
    case AirportCode.DAM:
      return appLoc.damascus;
    case AirportCode.BEY:
      return appLoc.beirut;
    case AirportCode.CAI:
      return appLoc.cairo;
    case AirportCode.AMM:
      return appLoc.amman;
    case AirportCode.SAW:
      return appLoc.istanbulSabiha;
    case AirportCode.IST:
      return appLoc.istanbulAtaturk;
    default:
      return appLoc.baghdad;
  }
}

String mapAirlineCodeToName(Airline code, AppLocalizations appLoc) {
  switch (code) {
    case Airline.THY:
      return appLoc.tukishAirline;
    case Airline.FBA:
      return appLoc.flyBaghdad;
    case Airline.IAW:
      return appLoc.iraqiAirline;
    case Airline.MEA:
      return appLoc.lebanonAirline;
    case Airline.SAW:
      return appLoc.shamWings;
    default:
      return appLoc.iraqiAirline;
  }
}

String mapAirlineCodeToLogo(Airline code) {
  switch (code) {
    case Airline.THY:
      return AppAssets.turkishAirlinesLogo;
    case Airline.FBA:
      return AppAssets.flyBagdadLogo;
    case Airline.IAW:
      return AppAssets.iraqiAirlinesLogo;
    case Airline.MEA:
      return AppAssets.lebanonAirlinesLogo;
    case Airline.SAW:
      return AppAssets.shamWingsLogo;
    default:
      return AppAssets.iraqiAirlinesLogo;
  }
}

class Validators {
  AppLocalizations appLoc;
  Validators({required this.appLoc});

  String? validatePhoneNo(String? phoneNo) {
    final phoneRegEx = RegExp(r"07[3-9][0-9]{8}");
    if (phoneNo == null || phoneNo.isEmpty) {
      return appLoc.pleaseEnterPhoneNumber;
    } else if (!phoneRegEx.hasMatch(phoneNo) || phoneNo.length > 11) {
      return appLoc.pleaseEnterACorrectNumber;
    }
    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return appLoc.pleaseEnterName;
    } else if (fullName.length < 8) {
      return appLoc.pleaseEnterFullName;
    }
    return null;
  }

  String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return appLoc.pleaseEnterAddress;
    } else if (address.length < 8) {
      return appLoc.pleaseEnterDetailedAddress;
    }
    return null;
  }
}
