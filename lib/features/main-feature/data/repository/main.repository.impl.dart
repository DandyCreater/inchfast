import 'package:dartz/dartz.dart';

import '../../domain/entity/location_area.entity.dart';
import '../../domain/entity/location_building.entity.dart';
import '../../domain/entity/location_section.entity.dart';
import '../../domain/entity/moving_box.entity.dart';
import '../../domain/entity/submit_moving_box.entity.dart';
import '../../domain/entity/submit_unloading.entity.dart';
import '../../domain/entity/unloading.entity.dart';
import '../../domain/entity/unloading_location.entity.dart';
import '../../domain/entity/unloading_status.entity.dart';
import '../../domain/parameter/submit_moving_box.parameter.dart';
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
  Future<Either<String, SubmitUnloadingEntity?>> submitUnloading(
      SubmitUnloadingParams params) async {
    final result = await _remoteDataSource.submitUnloading(params);
    if (result != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(result?.message ?? '');
    }
  }

  @override
  Future<Either<String, MovingBoxEntity?>> searchMovingBox(
      String params) async {
    final result = await _remoteDataSource.searchMovingBox(params);
    if (result!.code != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(
        result.message ?? '',
      );
    }
  }

  @override
  Future<Either<String, LocationBuildingEntity?>> locationBuildingData() async {
    final result = await _remoteDataSource.locationBuildingData();
    if (result!.code != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(
        result.message ?? '',
      );
    }
  }

  @override
  Future<Either<String, LocationAreaEntity?>> locationAreaData(
      String idBuilding) async {
    final result = await _remoteDataSource.locationAreaData(
      idBuilding,
    );
    if (result!.code != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(
        result.message ?? '',
      );
    }
  }

  @override
  Future<Either<String, LocationSectionEntity?>> locationSectionData(
      String idArea) async {
    final result = await _remoteDataSource.locationSectionData(
      idArea,
    );
    if (result!.code != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(
        result.message ?? '',
      );
    }
  }

  @override
  Future<Either<String, SubmitMovingBoxEntity?>> submitMovingBox(
      SubmitMovingBoxParams params) async {
    final result = await _remoteDataSource.submitMovingBox(params);
    if (result != null && result.code == 200) {
      return right(
        result.toEntity(),
      );
    } else {
      return left(result?.message ?? '');
    }
  }
}
