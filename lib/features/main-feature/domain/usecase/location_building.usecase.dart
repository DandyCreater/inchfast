import 'package:dartz/dartz.dart';

import '../entity/location_building.entity.dart';
import '../repository/main.repository.dart';

class LocationBuildingUseCase {
  final MainRepository _repository;

  LocationBuildingUseCase(this._repository);

  Future<Either<String, LocationBuildingEntity?>> call() {
    return _repository.locationBuildingData();
  }
}
