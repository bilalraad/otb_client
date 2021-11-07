import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:otbclient/src/data/local_database/app_local_db.dart';
import 'package:otbclient/src/data/models/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final FirebaseMessaging _fcm;
  final BaseApplocalDB _lcoalDB;
  AppUserCubit(this._fcm, this._lcoalDB) : super(const AppUserState()) {
    _getUserToken();
  }

  void _getUserToken() async {
    try {
      final appUser = await _lcoalDB.getUserData();
      if (appUser != null && appUser.deviceToken.isNotEmpty) {
        emit(
            AppUserState(status: AppUserStatus.tokenRegistered, user: appUser));
      } else {
        final deviceToken = await _fcm.getToken();
        print(deviceToken);

        emit(AppUserState(
            status: AppUserStatus.tokenRegistered,
            user: AppUser(deviceToken: deviceToken!)));
        _lcoalDB.updateUserData(state.user);
      }
    } catch (e) {
      print(e);
    }
  }

  void updateUserInfo({
    required AppUser user,
  }) async {
    emit(
      AppUserState(status: AppUserStatus.tokenRegistered, user: user),
    );
    _lcoalDB.updateUserData(state.user);
  }
}
