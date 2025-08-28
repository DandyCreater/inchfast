import 'package:dartz/dartz.dart';

import '../parameter/submit_unloading.parameter.dart';
import '../repository/main.repository.dart';

class SubmitUnloadingUseCase {
  final MainRepository _repository;

  const SubmitUnloadingUseCase(this._repository);

  Future<Either<String, void>> call(
    SubmitUnloadingParams params,
  ) {
    return _repository.submitUnloading(params);
  }
}
