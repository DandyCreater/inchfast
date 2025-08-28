import '../../domain/parameter/submit_high_rack.parameter.dart';
import '../../domain/parameter/submit_moving_box.parameter.dart';
import '../../domain/parameter/submit_unloading.parameter.dart';
import '../model/high_rack.model.dart';
import '../model/location_area.model.dart';
import '../model/location_building.model.dart';
import '../model/location_rack.model.dart';
import '../model/location_section.model.dart';
import '../model/moving_box.model.dart';
import '../model/submit_high_rack.model.dart';
import '../model/submit_moving_box.model.dart';
import '../model/submit_unloading.model.dart';
import '../model/unloading.model.dart';
import '../model/unloading_location.model.dart';
import '../model/unloading_status.model.dart';

abstract class MainRemoteDataSource {
  Future<UnloadingModel?> searchUnloading(String params);
  Future<UnloadingStatusModel?> unloadingStatus();
  Future<UnloadingLocationModel?> unloadingLocation();
  Future<SubmitUnloadingModel?> submitUnloading(SubmitUnloadingParams params);
  Future<MovingBoxModel?> searchMovingBox(String params);
  Future<HighRackModel?> searchHighRack(String params);
  Future<LocationBuildingModel?> locationBuildingData();
  Future<LocationAreaModel?> locationAreaData(
    String idBuilding,
  );
  Future<LocationSectionModel?> locationSectionData(
    String idArea,
  );
  Future<SubmitMovingBoxModel?> submitMovingBox(SubmitMovingBoxParams params);
  Future<LocationRackModel?> searchRackLocation(String params);
  Future<SubmitHighRackModel?> submitHighRack(SubmitHighRackParameter params);
}
