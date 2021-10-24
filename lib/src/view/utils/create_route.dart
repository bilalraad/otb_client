import 'package:flutter/material.dart';

///this function will make special transition animation
///if you want to change the effect then set the [curve] to watever u want
Route createRoute(Widget route, {Cubic curve = Curves.ease}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      final end = Offset.zero;
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
