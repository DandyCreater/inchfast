import 'package:inchfast/core/constants/api.const.dart';
import 'package:inchfast/core/services/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/hive_const.dart';
import '../../../domain/parameter/login.parameter.dart';
import '../../model/login.model.dart';
import 'auth_remote.datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService _service;

  AuthRemoteDataSourceImpl(this._service);

  @override
  Future<LoginModel?> login(LoginParameter params) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await _service.post(
      APIConst.login,
      data: params.toJson(),
    );

    if (result.statusCode == 200) {
      final res = LoginModel.fromJson(result.data);
      await prefs.setString(
        SharedPrefConst.token,
        res.data?.rawToken ?? '',
      );
      return res;
    } else {
      print(result.data);
      return LoginModel.fromJson(result.data);
    }
  }
}
