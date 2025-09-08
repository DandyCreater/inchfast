import 'package:dartz/dartz.dart';

import '../entity/vehicle.entity.dart';
import '../repository/main.repository.dart';

class VehicleDataUseCase {
  final MainRepository _mainRepository;

  VehicleDataUseCase(this._mainRepository);

  Future<Either<String, VehicleEntity?>> call(String params) {
    return _mainRepository.vehicleData(params);
  }
}
