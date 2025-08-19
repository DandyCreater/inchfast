import 'package:dartz/dartz.dart';

import '../../domain/entity/unloading.entity.dart';
import '../../domain/entity/unloading_location.entity.dart';
import '../../domain/entity/unloading_status.entity.dart';
import '../../domain/parameter/submit_unloading.parameter.dart';
import '../../domain/repository/main.repository.dart';
import '../datasources/main_remote.datasource.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource _remoteDataSource;

  MainRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<String, UnloadingEntity?>> searchUnloading(
      String params) async {
    final result = await _remoteDataSource.searchUnloading(params);
    if (result != null && result.code == 200) {
      return right(result.toEntity());
    } else {
      return left(result?.message ?? '');
    }
  }

  @override
  Future<Either<String, UnloadingStatusEntity?>> unloadingStatus() async {
    final result = await _remoteDataSource.unloadingStatus();
    if (result != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(result?.message ?? '');
    }
  }

  @override
  Future<Either<String, UnloadingLocationEntity?>> unloadingLocation() async {
    final result = await _remoteDataSource.unloadingLocation();
    if (result != null && result.code == 200) {
      return right(result.toEntity());
    } else {
      return left(result?.message ?? '');
    }
  }

  @override
  Future<Either<String, void>> submitUnloading(
      SubmitUnloadingParams params) async {
    final result = await _remoteDataSource.submitUnloading(params);
    return right(result);
  }
}
