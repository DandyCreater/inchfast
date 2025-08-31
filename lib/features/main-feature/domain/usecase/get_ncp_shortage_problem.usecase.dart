import 'package:dartz/dartz.dart';

import '../entity/shortage_problem.entity.dart';
import '../repository/main.repository.dart';

class ShortAgeProblemUseCase {
  final MainRepository _mainRepository;

  const ShortAgeProblemUseCase(this._mainRepository);

  Future<Either<String?, ShortageProblemEntity?>> call() {
    return _mainRepository.ncpShortageProblem();
  }
}
