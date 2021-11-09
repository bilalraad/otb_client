import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import './app.dart';
import './src/bloc/app_user/app_user_cubit.dart';
import './src/data/API/search_query_service.dart';
import './src/data/local_database/app_local_db.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    Bloc.observer = AppObserver();
    final _tripsQueryService = FirebaseTripsQueryService();
    final _appUserCubit =
        AppUserCubit(FirebaseMessaging.instance, SecureLocalDB());
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(BlocProvider.value(
      value: _appUserCubit,
      child:
          OTBApp(tripsQueryService: _tripsQueryService, flavor: 'development'),
    ));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class AppObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    FirebaseCrashlytics.instance.setCustomKey('bloc_error',
        "error " + error.toString() + "stackTrace " + stackTrace.toString());
  }
}
