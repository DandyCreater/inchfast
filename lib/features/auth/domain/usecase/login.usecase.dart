import 'package:dartz/dartz.dart';

import '../entity/login.entity.dart';
import '../parameter/login.parameter.dart';
import '../repository/auth.repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);
  Future<Either<String, LoginEntity?>> call(LoginParameter params) {
    return _repository.login(params);
  }
}
