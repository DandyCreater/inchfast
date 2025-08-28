import 'package:dartz/dartz.dart';

import '../entity/submit_high_rack.entity.dart';
import '../parameter/submit_high_rack.parameter.dart';
import '../repository/main.repository.dart';

class SubmitHighRackUseCase {
  final MainRepository _repository;

  const SubmitHighRackUseCase(this._repository);

  Future<Either<String, SubmitHighRackEntity?>> call(
      SubmitHighRackParameter params) async {
    return _repository.submitHighRack(params);
  }
}
