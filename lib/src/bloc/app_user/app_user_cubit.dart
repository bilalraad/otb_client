import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:otbclient/src/view/utils/utils.dart';
import '../../data/local_database/app_local_db.dart';
import '../../data/models/user.dart';

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
      await FirebaseAuth.instance.signInAnonymously();

      if (appUser != null && appUser.deviceToken.isNotEmpty) {
        emit(
            AppUserState(status: AppUserStatus.tokenRegistered, user: appUser));
      } else {
        //!: Not a good way to garnt user token 100%
        final deviceToken = await _fcm.getToken();
        if (deviceToken == null) {
          emit(AppUserState(
              status: AppUserStatus.tokenRegistered,
              user: AppUser(deviceToken: deviceToken!)));
        } else {
          emit(const AppUserState(status: AppUserStatus.noToken));
        }
        _lcoalDB.updateUserData(state.user);
      }
    } catch (e, s) {
      logger(AppUserCubit).d(e);
      logger(AppUserCubit).d(s);
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
