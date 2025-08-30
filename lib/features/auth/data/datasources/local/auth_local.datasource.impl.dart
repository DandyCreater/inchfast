import 'package:hive/hive.dart';

import '../../../../../core/constants/hive_const.dart';
import '../../model/login.model.dart';
import 'auth_local.datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _box;

  AuthLocalDataSourceImpl(this._box);

  @override
  Future<LoginModel?> getUserData() async {
    final data = _box.get(
      HiveConst.user,
    );
    if (data == null) return null;

    return LoginModel.fromJson(Map<String, dynamic>.from(data));
  }

  @override
  Future<void> saveUserData(LoginModel data) async {
    await _box.put(
      HiveConst.user,
      data.toJson(),
    );
  }

  @override
  Future<void> deleteUserData() async {
    await _box.delete(
      HiveConst.user,
    );
  }
}
