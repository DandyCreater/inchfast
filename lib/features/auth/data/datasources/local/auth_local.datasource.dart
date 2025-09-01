import '../../model/login.model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserData(LoginModel data);
  Future<LoginModel?> getUserData();
  Future<void> deleteUserData();
}
