import 'package:dartz/dartz.dart';

import '../entity/unloading.entity.dart';
import '../entity/unloading_location.entity.dart';
import '../entity/unloading_status.entity.dart';
import '../parameter/submit_unloading.parameter.dart';

abstract class MainRepository {
  Future<Either<String, UnloadingEntity?>> searchUnloading(String params);
  Future<Either<String, UnloadingStatusEntity?>> unloadingStatus();
  Future<Either<String, UnloadingLocationEntity?>> unloadingLocation();
  Future<Either<String, void>> submitUnloading(SubmitUnloadingParams params);
}
