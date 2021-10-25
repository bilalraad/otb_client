import 'dart:io';

import 'package:otb_client/src/data/models/trips_query.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp({
  int phone = 07821304951,
}) async {
  String url() {
    if (Platform.isAndroid) {
      return "whatsapp://wa.me/$phone:/?text=${Uri.parse('message')}";
    } else {
      return "whatsapp://send?phone=$phone&text=${Uri.parse('message')}";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}

String tripQueryToWhatsAppMessage(TripsQuery query) {
  return '';
}
