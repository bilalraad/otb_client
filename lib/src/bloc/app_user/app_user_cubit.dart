import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:otbclient/src/data/models/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final FirebaseMessaging _fcm;

  AppUserCubit(this._fcm) : super(const AppUserState());

  void getUserToken() async {
    try {
      final deviceToken = await _fcm.getToken();
      print(deviceToken);
      emit(AppUserState(
          status: AppUserStatus.tokenRegistered,
          user: AppUser(deviceToken: deviceToken!)));
    } catch (e) {
      print(e);
    }
  }
}
