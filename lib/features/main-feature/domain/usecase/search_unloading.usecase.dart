import 'package:dartz/dartz.dart';

import '../entity/unloading.entity.dart';
import '../repository/main.repository.dart';

class SearchUnloadingUseCase {
  final MainRepository _repository;

  const SearchUnloadingUseCase(this._repository);

  Future<Either<String, UnloadingEntity?>> call(String params) {
    return _repository.searchUnloading(params);
  }
}
