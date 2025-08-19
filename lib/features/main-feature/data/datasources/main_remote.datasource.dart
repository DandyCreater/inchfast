import '../../domain/parameter/submit_unloading.parameter.dart';
import '../model/unloading.model.dart';
import '../model/unloading_location.model.dart';
import '../model/unloading_status.model.dart';

abstract class MainRemoteDataSource {
  Future<UnloadingModel?> searchUnloading(String params);
  Future<UnloadingStatusModel?> unloadingStatus();
  Future<UnloadingLocationModel?> unloadingLocation();
  Future<void> submitUnloading(SubmitUnloadingParams params);
}
