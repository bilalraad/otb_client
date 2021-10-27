import 'dart:io';

import 'package:flutter/material.dart';
import 'package:otb_client/src/data/models/trips_query.dart';
import 'package:url_launcher/url_launcher.dart';

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

void validateTripQuery(TripsQuery query) {
  if (query.type.isEmpty) {
    throw 'Please select a type';
  } else if (query.tripCategory.isEmpty) {
    throw 'Please select a category';
  } else if (query.departureCity.isEmpty) {
    throw 'Please select a Departure City';
  } else if (query.arriveCity.isEmpty) {
    throw 'Please select a Arrive City';
  } else if (query.leaveDate.isEmpty) {
    throw 'Please select a leave Date';
  } else if (query.leaveDate.isEmpty) {
    throw 'Please select a return Date';
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
