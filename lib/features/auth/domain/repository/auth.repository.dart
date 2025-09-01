import 'package:dartz/dartz.dart';

import '../entity/login.entity.dart';
import '../parameter/login.parameter.dart';

abstract class AuthRepository {
  Future<Either<String, LoginEntity?>> login(LoginParameter params);
  Future<LoginEntity?> getUserData();
  Future<void> deleteUserData();
}
