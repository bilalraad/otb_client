import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:otbclient/src/data/fake_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import './app.dart';
import './src/view/utils/utils.dart';
import './src/bloc/app_user/app_user_cubit.dart';
import './src/data/API/search_query_service.dart';
import './src/data/local_database/app_local_db.dart';
import 'src/bloc/search_query/search_query_bloc.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    await Firebase.initializeApp();

    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    Bloc.observer = AppObserver();
    final _tripsQueryService = FirebaseTripsQueryService();
    final _appUserCubit =
        AppUserCubit(FirebaseMessaging.instance, SecureLocalDB());
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }

    runApp(BlocProvider.value(
      value: _appUserCubit,
      child:
          OTBApp(tripsQueryService: _tripsQueryService, flavor: 'development'),
    ));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class AppObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event is QuerySubmitted) {
      Future.delayed(const Duration(seconds: 10), () {
        logger(FirebaseTripsQueryService).d('event');
        logger(FirebaseTripsQueryService).d(event);

        final _fireStore = FirebaseFirestore.instance;
        final resultItems = (event.query.type == TripType.oneWay
            ? searchResultOneWay['resultItems']
            : searchResult['resultItems']) as List<Map<String, dynamic>>;
        for (var item in resultItems) {
          _fireStore
              .collection('quries')
              .doc(event.query.queryId)
              .collection('queryResults')
              .add(item);
        }
      });
    }
    logger(AppObserver).d("Event" + event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger(AppObserver).i('onTransition');
    logger(AppObserver).d(transition.currentState);
    logger(AppObserver).d(transition.nextState);
    logger(AppObserver).d(transition.nextState == transition.currentState);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger(AppObserver).e(error);
    logger(AppObserver).e(stackTrace);
    FirebaseCrashlytics.instance.setCustomKey('bloc_error',
        "error " + error.toString() + "stackTrace " + stackTrace.toString());
  }
}
