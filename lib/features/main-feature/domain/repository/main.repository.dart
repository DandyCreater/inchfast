import 'package:dartz/dartz.dart';

import '../entity/high_rack.entity.dart';
import '../entity/location_area.entity.dart';
import '../entity/location_building.entity.dart';
import '../entity/location_rack.entity.dart';
import '../entity/location_section.entity.dart';
import '../entity/moving_box.entity.dart';
import '../entity/ncp_feedback_location.entity.dart';
import '../entity/ncp_number.entity.dart';
import '../entity/ncp_part_number.entity.dart';
import '../entity/ncp_part_type.entity.dart';
import '../entity/packing_month.entity.dart';
import '../entity/shortage_problem.entity.dart';
import '../entity/submit_high_rack.entity.dart';
import '../entity/submit_moving_box.entity.dart';
import '../entity/submit_ncp.entity.dart';
import '../entity/submit_unloading.entity.dart';
import '../entity/unloading.entity.dart';
import '../entity/unloading_location.entity.dart';
import '../entity/unloading_status.entity.dart';
import '../entity/vehicle.entity.dart';
import '../parameter/ncp_part_number.parameter.dart';
import '../parameter/submit_high_rack.parameter.dart';
import '../parameter/submit_moving_box.parameter.dart';
import '../parameter/submit_ncp.parameter.dart';
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
  Future<Either<String, HighRackEntity?>> searchHighRack(
    String params,
  );
  Future<Either<String, LocationRackEntity?>> searchRackLocation(
    String params,
  );
  Future<Either<String, SubmitHighRackEntity?>> submitHighRack(
    SubmitHighRackParameter params,
  );
  Future<Either<String, PackingMonthEntity?>> packingMonth();
  Future<Either<String, VehicleEntity?>> vehicleData(
    String params,
  );
  Future<Either<String?, NcpNumberEntity?>> getNcpNumber();
  Future<Either<String?, NcpPartNumberEntity?>> searchNcpPartNumber(
    NcpPartNumberParameter params,
  );
  Future<Either<String?, SubmitNcpEntity?>> submitNcpData(
    AddNcpParameter params,
  );
  Future<Either<String?, NcpPartTypeEntity?>> ncpPartData();
  Future<Either<String?, NcpFeedBackLocationEntity?>> ncpFeedBackLocation();
  Future<Either<String?, ShortageProblemEntity?>> ncpShortageProblem();
}
