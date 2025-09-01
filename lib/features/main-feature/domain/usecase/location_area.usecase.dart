import 'package:dartz/dartz.dart';

import '../entity/location_area.entity.dart';
import '../repository/main.repository.dart';

class LocationAreaUseCase {
  final MainRepository _repository;

  const LocationAreaUseCase(this._repository);
  Future<Either<String, LocationAreaEntity?>> call(
    String idBuilding,
  ) {
    return _repository.locationAreaData(
      idBuilding,
    );
  }
}
