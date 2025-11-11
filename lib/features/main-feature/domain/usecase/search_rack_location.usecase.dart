import 'package:dartz/dartz.dart';

import '../entity/location_rack.entity.dart';
import '../repository/main.repository.dart';

class SearchRackLocationUseCase {
  final MainRepository _repository;

  const SearchRackLocationUseCase(this._repository);

  Future<Either<String?, LocationRackEntity?>> call(String params) {
    return _repository.searchRackLocation(params);
  }
}
