import '../repository/auth.repository.dart';

class ClearUserDataUseCase {
  final AuthRepository _repository;

  ClearUserDataUseCase(this._repository);

  Future<void> call() {
    return _repository.deleteUserData();
  }
}
