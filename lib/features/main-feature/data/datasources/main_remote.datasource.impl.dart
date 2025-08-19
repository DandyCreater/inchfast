import '../../../../core/constants/api.const.dart';
import '../../../../core/services/network.dart';
import '../../domain/parameter/submit_unloading.parameter.dart';
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
  Future<void> submitUnloading(SubmitUnloadingParams params) async {
    final result = await _apiService.post(
      APIConst.submitUnloading,
      data: params.toJson(),
    );
    print(result.data);
  }
}
