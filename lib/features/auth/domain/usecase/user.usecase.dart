import '../entity/login.entity.dart';
import '../repository/auth.repository.dart';

class UserUseCase {
  final AuthRepository _repository;

  UserUseCase(this._repository);

  Future<LoginEntity?> call() {
    return _repository.getUserData();
  }
}
