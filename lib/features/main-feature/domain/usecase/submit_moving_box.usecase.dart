import 'package:dartz/dartz.dart';

import '../parameter/submit_moving_box.parameter.dart';
import '../repository/main.repository.dart';

class SubmitMovingBoxUseCase {
  final MainRepository _repository;

  const SubmitMovingBoxUseCase(this._repository);

  Future<Either<String, void>> call(
    SubmitMovingBoxParams params,
  ) {
    return _repository.submitMovingBox(params);
  }
}
