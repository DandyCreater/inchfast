import '../../../../core/constants/api.const.dart';
import '../../../../core/services/network.dart';
import '../../domain/parameter/location_area.parameter.dart';
import '../../domain/parameter/location_building.parameter.dart';
import '../../domain/parameter/location_section.parameter.dart';
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
import 'main_remote.datasource.dart';

class MainRemoteDataSourceImpl implements MainRemoteDataSource {
  final ApiService _apiService;

  const MainRemoteDataSourceImpl(this._apiService);
  @override
  Future<UnloadingModel?> searchUnloading(String params) async {
    final result =
        await _apiService.get(APIConst.searchUnloading, queryParams: {
      'search': params,
    });
    return UnloadingModel.fromJson(
      result.data,
    );
  }

  @override
  Future<UnloadingStatusModel?> unloadingStatus() async {
    final result = await _apiService.get(
      APIConst.unloadingStatus,
    );
    return UnloadingStatusModel.fromJson(
      result.data,
    );
  }

  @override
  Future<UnloadingLocationModel?> unloadingLocation() async {
    final result = await _apiService.get(APIConst.unloadingLocation);
    return UnloadingLocationModel.fromJson(
      result.data,
    );
  }

  @override
  Future<SubmitUnloadingModel?> submitUnloading(
      SubmitUnloadingParams params) async {
    final result = await _apiService.post(
      APIConst.submitUnloading,
      data: params.toJson(),
    );
    return SubmitUnloadingModel.fromJson(
      result.data,
    );
  }

  @override
  Future<MovingBoxModel?> searchMovingBox(String params) async {
    final result =
        await _apiService.get(APIConst.searchMovingBox, queryParams: {
      'search': params,
    });
    return MovingBoxModel.fromJson(
      result.data,
    );
  }

  @override
  Future<LocationBuildingModel?> locationBuildingData() async {
    const params = LocationBuildingParameter(
      start: 1,
      length: 500,
    );

    final result = await _apiService.get(
      APIConst.locationBuildingList,
      queryParams: params.toJson(),
    );

    return LocationBuildingModel.fromJson(
      result.data,
    );
  }

  @override
  Future<LocationAreaModel?> locationAreaData(
    String idBuilding,
  ) async {
    final params = LocationAreaParameter(
      start: 1,
      length: 100,
      idBuilding: idBuilding,
    );

    final result = await _apiService.get(
      APIConst.locationAreaList,
      // "${APIConst.locationAreaList}?id_building=$idBuilding&start=1&length=100",
      queryParams: params.toJson(),
    );
    return LocationAreaModel.fromJson(
      result.data,
    );
  }

  @override
  Future<LocationSectionModel?> locationSectionData(String idArea) async {
    final params = LocationSectionParameter(
      idArea: idArea,
      start: 1,
      length: 100,
    );

    final result = await _apiService.get(
      APIConst.locationSectionList,
      queryParams: params.toJson(),
    );
    return LocationSectionModel.fromJson(
      result.data,
    );
  }

  @override
  Future<SubmitMovingBoxModel?> submitMovingBox(
      SubmitMovingBoxParams params) async {
    final result = await _apiService.post(
      APIConst.submitMovingBox,
      data: params.toJson(),
    );
    return SubmitMovingBoxModel.fromJson(
      result.data,
    );
  }

  @override
  Future<HighRackModel?> searchHighRack(String params) async {
    final result = await _apiService.get(APIConst.searchHighRack, queryParams: {
      'search': params,
    });
    return HighRackModel.fromJson(
      result.data,
    );
  }

  @override
  Future<LocationRackModel?> searchRackLocation(String params) async {
    final result = await _apiService.get("${APIConst.locationRack}/$params");
    return LocationRackModel.fromJson(result.data);
  }

  @override
  Future<SubmitHighRackModel?> submitHighRack(
    SubmitHighRackParameter params,
  ) async {
    final result = await _apiService
        .put("${APIConst.movePart}/${params.id}/${params.newId}");
    return SubmitHighRackModel.fromJson(result.data);
  }
}
