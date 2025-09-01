import 'package:dartz/dartz.dart';

import '../entity/unloading_location.entity.dart';
import '../repository/main.repository.dart';

class UnloadingLocationUseCase {
  final MainRepository _repository;

  const UnloadingLocationUseCase(this._repository);

  Future<Either<String, UnloadingLocationEntity?>> call() {
    return _repository.unloadingLocation();
  }
}
