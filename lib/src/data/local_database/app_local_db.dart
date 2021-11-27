import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';

abstract class BaseApplocalDB {
  void updateUserData(AppUser user);
  Future<AppUser?> getUserData();
}

class SecureLocalDB extends BaseApplocalDB {
  final _secureStorage = const FlutterSecureStorage();
  @override
  Future<AppUser?> getUserData() async {
    try {
      final _userJson = await _secureStorage.read(key: 'user');
      if (_userJson != null) {
        return AppUser.fromJson(_userJson);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void updateUserData(AppUser user) async {
    try {
      await _secureStorage.write(key: 'user', value: user.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
