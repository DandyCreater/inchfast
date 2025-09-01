import 'package:dartz/dartz.dart';

import '../entity/moving_box.entity.dart';
import '../repository/main.repository.dart';

class SearchMovingBoxUseCase {
  final MainRepository _repository;

  const SearchMovingBoxUseCase(this._repository);

  Future<Either<String, MovingBoxEntity?>> call(String params) {
    return _repository.searchMovingBox(params);
  }
}
