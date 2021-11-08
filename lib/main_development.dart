import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import './app.dart';
import './src/view/utils/utils.dart';
import './src/bloc/app_user/app_user_cubit.dart';
import './src/data/API/search_query_service.dart';
import './src/data/local_database/app_local_db.dart';

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
    child: OTBApp(tripsQueryService: _tripsQueryService, flavor: 'development'),
  ));
}

class AppObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
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
  }
}
