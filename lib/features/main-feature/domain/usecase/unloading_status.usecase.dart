import 'package:dartz/dartz.dart';

import '../entity/unloading_status.entity.dart';
import '../repository/main.repository.dart';

class UnloadingStatusUseCase {
  final MainRepository _repository;

  const UnloadingStatusUseCase(this._repository);

  Future<Either<String, UnloadingStatusEntity?>> call() {
    return _repository.unloadingStatus();
  }
}
