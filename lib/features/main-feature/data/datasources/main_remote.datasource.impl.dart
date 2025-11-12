import '../../../../core/constants/api.const.dart';
import '../../../../core/services/network.dart';
import '../../domain/parameter/location_area.parameter.dart';
import '../../domain/parameter/location_building.parameter.dart';
import '../../domain/parameter/location_section.parameter.dart';
import '../../domain/parameter/ncp_part_number.parameter.dart';
import '../../domain/parameter/submit_high_rack.parameter.dart';
import '../../domain/parameter/submit_moving_box.parameter.dart';
import '../../domain/parameter/submit_ncp.parameter.dart';
import '../../domain/parameter/submit_unloading.parameter.dart';
import '../model/close_unloading.model.dart';
import '../model/high_rack.model.dart';
import '../model/location_area.model.dart';
import '../model/location_building.model.dart';
import '../model/location_rack.model.dart';
import '../model/location_section.model.dart';
import '../model/moving_box.model.dart';
import '../model/ncp_feedback_location.model.dart';
import '../model/ncp_number.model.dart';
import '../model/ncp_part_number.model.dart';
import '../model/ncp_part_type.model.dart';
import '../model/packing_month.model.dart';
import '../model/shortage_problem.model.dart';
import '../model/submit_high_rack.model.dart';
import '../model/submit_moving_box.model.dart';
import '../model/submit_ncp.model.dart';
import '../model/submit_unloading.model.dart';
import '../model/unloading.model.dart';
import '../model/unloading_location.model.dart';
import '../model/unloading_status.model.dart';
import '../model/vehicle.model.dart';
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

  @override
  Future<PackingMonthModel?> packingMonth() async {
    final result = await _apiService.get(
      APIConst.packingMonth,
    );
    return PackingMonthModel.fromJson(result.data);
  }

  @override
  Future<VehicleModel?> vehicleData(String params) async {
    final result = await _apiService.get(
      "${APIConst.vehicle}/$params",
    );
    return VehicleModel.fromJson(
      result.data,
    );
  }

  @override
  Future<NcpNumberModel?> getNcpNumber() async {
    final result = await _apiService.get(
      APIConst.ncpNumber,
    );
    return NcpNumberModel.fromJson(result.data);
  }

  @override
  Future<NcpPartNumberModel?> searchNcpPartNumber(
      NcpPartNumberParameter params) async {
    final result = await _apiService.get(
      "${APIConst.searchNcpData}/${params.packingMonth}/IIMI.MB",
      queryParams: params.toJson(),
    );
    return NcpPartNumberModel.fromJson(result.data);
  }

  @override
  Future<SubmitNcpModel?> submitNcpData(AddNcpParameter params) async {
    final result = await _apiService.post(
      APIConst.submitNcp,
      data: params.toJson(),
    );
    return SubmitNcpModel.fromJson(
      result.data,
    );
  }

  @override
  Future<NcpPartTypeModel?> ncpPartData() async {
    final result = await _apiService.get(
      APIConst.ncpPartTypeList,
    );
    return NcpPartTypeModel.fromJson(result.data);
  }

  @override
  Future<NcpFeedBackLocationModel?> ncpFeedBackLocation() async {
    final result = await _apiService.get(
      APIConst.ncpFeedBackLocationList,
    );
    return NcpFeedBackLocationModel.fromJson(
      result.data,
    );
  }

  @override
  Future<ShortageProblemModel?> ncpShortageProblem() async {
    final result = await _apiService.get(
      APIConst.shortageProblemList,
    );
    return ShortageProblemModel.fromJson(
      result.data,
    );
  }

  @override
  Future<CloseUnloadingModel?> closeUnloading(String params) async {
    final result = await _apiService.put(
      "${APIConst.closeUnloading}/$params",
    );
    return CloseUnloadingModel.fromJson(
      result.data,
    );
  }
}
