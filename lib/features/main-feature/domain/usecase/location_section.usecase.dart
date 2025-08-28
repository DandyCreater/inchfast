import 'package:dartz/dartz.dart';

import '../entity/location_section.entity.dart';
import '../repository/main.repository.dart';

class LocationSectionUseCase {
  final MainRepository _repository;

  const LocationSectionUseCase(this._repository);

  Future<Either<String, LocationSectionEntity?>> call(String idArea) {
    return _repository.locationSectionData(
      idArea,
    );
  }
}
