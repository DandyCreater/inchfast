import 'package:dartz/dartz.dart';

import '../entity/close_unloading.entity.dart';
import '../repository/main.repository.dart';

class CloseUnloadingUseCase {
  final MainRepository _repository;

  const CloseUnloadingUseCase(this._repository);

  Future<Either<List<ListDataEntity>?, CloseUnloadingEntity?>> call(
      String params) {
    return _repository.closeUnloading(params);
  }
}
