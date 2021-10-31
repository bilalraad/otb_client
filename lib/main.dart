import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'src/data/API/search_query_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppObserver();
  final _tripsQueryService = MockTripsQueryService();
  runApp(OTBApp(tripsQueryService: _tripsQueryService));
}

class AppObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition.currentState);
    print(transition.nextState);
    print(transition.nextState == transition.currentState);
    super.onTransition(bloc, transition);

    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(stackTrace);
  }
}
