import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/trips_query.dart';
import '../../localization/app_localizations.dart';
import './utils.dart';

void launchWhatsApp({
  //TODO: Change to the otb real number
  int phone = 07821304951,
  TripsQuery? query,
}) async {
  String url() {
    if (Platform.isAndroid) {
      if (query == null) return 'https://wa.me/+964$phone';

      return "https://wa.me/+964$phone/?text=${_tripQueryToWhatsAppMessage(query)}";
    } else {
      if (query == null) {
        return 'https://api.whatsapp.com/send?phone=+964$phone';
      }

      return "https://api.whatsapp.com/send?phone=+964$phone&text=${_tripQueryToWhatsAppMessage(query)}";
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

String _tripQueryToWhatsAppMessage(TripsQuery query) {
  //TODO: make sure to send [tripCategory] and [type] in their string fromat
  return ('اريد حجز رحلة من ${query.departureCity} الى ${query.arriveCity} \n'
      'نوع الرحلة: ${query.type}\n'
      'فئة الرحلة: ${query.tripCategory}\n\n'
      'موعد المغادرة: ${query.leaveDate}\n'
      'موعد العودة: ${query.returnDate ?? 'لا يوجد'}\n\n'
      'عدد المسافرين\n'
      'الكبار: ${query.travelers.adults}\n'
      'الاطفال: ${query.travelers.kids == 0 ? 'لايوجد' : query.travelers.kids}\n'
      'الرضع: ${query.travelers.infants == 0 ? 'لايوجد' : query.travelers.infants}\n\n'
      'الخطوط الجوية المحددة:\n${query.airLines}');
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

String? validatePhoneNo(String? phoneNo) {
  //TODO: INTEGRATE LOCALIZATION
  final phoneRegEx = RegExp(r"07[3-9][0-9]{8}");
  if (phoneNo == null || phoneNo.isEmpty) {
    return "رجاءا ادخل رقم الهاتف";
  } else if (!phoneRegEx.hasMatch(phoneNo) || phoneNo.length > 11) {
    return "الرقم غير صحيح";
  }
  return null;
}

String? validateFullName(String? fullName) {
  if (fullName == null || fullName.isEmpty) {
    return "الرجاء ادخال الاسم";
  } else if (fullName.length < 8) {
    return "الرجاء ادخال الاسم الكامل";
  }
  return null;
}

String? validateAddress(String? address) {
  if (address == null || address.isEmpty) {
    return "الرجاء ادخال العنوان";
  } else if (address.length < 8) {
    return "الرجاء ادخال عنوان مفصل";
  }
  return null;
}
