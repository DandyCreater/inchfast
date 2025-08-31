import 'package:dartz/dartz.dart';

import '../entity/high_rack.entity.dart';

import '../repository/main.repository.dart';

class SearchHighRackUseCase {
  final MainRepository _repository;

  const SearchHighRackUseCase(this._repository);

  Future<Either<String, HighRackEntity?>> call(String params) {
    return _repository.searchHighRack(params);
  }
}
