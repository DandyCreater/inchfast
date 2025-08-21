import 'package:dartz/dartz.dart';

import '../entity/location_area.entity.dart';
import '../entity/location_building.entity.dart';
import '../entity/location_section.entity.dart';
import '../entity/moving_box.entity.dart';
import '../entity/submit_moving_box.entity.dart';
import '../entity/submit_unloading.entity.dart';
import '../entity/unloading.entity.dart';
import '../entity/unloading_location.entity.dart';
import '../entity/unloading_status.entity.dart';
import '../parameter/submit_moving_box.parameter.dart';
import '../parameter/submit_unloading.parameter.dart';

abstract class MainRepository {
  Future<Either<String, UnloadingEntity?>> searchUnloading(String params);
  Future<Either<String, UnloadingStatusEntity?>> unloadingStatus();
  Future<Either<String, UnloadingLocationEntity?>> unloadingLocation();
  Future<Either<String, SubmitUnloadingEntity?>> submitUnloading(
      SubmitUnloadingParams params);
  Future<Either<String, MovingBoxEntity?>> searchMovingBox(String params);
  Future<Either<String, LocationBuildingEntity?>> locationBuildingData();
  Future<Either<String, LocationAreaEntity?>> locationAreaData(
    String idBuilding,
  );
  Future<Either<String, LocationSectionEntity?>> locationSectionData(
      String idArea);
  Future<Either<String, SubmitMovingBoxEntity?>> submitMovingBox(
      SubmitMovingBoxParams params);
}
