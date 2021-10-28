import 'dart:io';

import 'package:flutter/material.dart';
import '../../data/models/trips_query.dart';
import '../../localization/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'enums.dart';

void launchWhatsApp({
  int phone = 07821304951,
  String message = 'sdc',
  required TripsQuery query,
}) async {
  String url() {
    if (Platform.isAndroid) {
      return "https://wa.me/+964$phone/?text=${_tripQueryToWhatsAppMessage(query)}";
    } else {
      return "https://api.whatsapp.com/send?phone=+964$phone&text=${Uri.parse('message')}";
    }
  }

  try {
    await launch(url());
  } catch (e) {
    print(e);
  }
}

String _tripQueryToWhatsAppMessage(TripsQuery query) {
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

void validateTripQuery(TripsQuery query, AppLocalizations appLoc) {
  if (query.departureCity.isEmpty) {
    throw appLoc.pleaseSelectDepartureCity;
  } else if (query.arriveCity.isEmpty) {
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

///this function will make special transition animation
///if you want to change the effect then set the [curve] to watever u want
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

String mapAirportCodeToName(Airport code, AppLocalizations appLoc) {
  switch (code) {
    case Airport.BGW:
      return appLoc.baghdad;
    case Airport.DAM:
      return appLoc.damascus;
    case Airport.BEY:
      return appLoc.beirut;
    case Airport.CAI:
      return appLoc.cairo;
    case Airport.AMM:
      return appLoc.amman;
    case Airport.SAW:
      return appLoc.istanbulSabiha;
    case Airport.IST:
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
