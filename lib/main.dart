import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import './app.dart';
import 'src/bloc/app_user/app_user_cubit.dart';
import 'src/data/API/search_query_service.dart';
import 'src/data/local_database/app_local_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  Bloc.observer = AppObserver();
  final _tripsQueryService = MockTripsQueryService();
  final _appUserCubit =
      AppUserCubit(FirebaseMessaging.instance, SecureLocalDB());
  runApp(BlocProvider.value(
    value: _appUserCubit,
    child: OTBApp(tripsQueryService: _tripsQueryService),
  ));
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
