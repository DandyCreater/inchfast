import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:inchfast/core/constants/api.const.dart';
import 'package:inchfast/features/main-feature/domain/usecase/location_area.usecase.dart';
import 'package:inchfast/features/main-feature/presentation/cubit/submit-high-rack-cubit/submit_high_rack_cubit.dart';
import 'package:inchfast/features/main-feature/presentation/cubit/submit-moving-box-cubit/submit_moving_box_cubit.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/auth/data/datasources/local/auth_local.datasource.dart';
import '../../../features/auth/data/datasources/local/auth_local.datasource.impl.dart';
import '../../../features/auth/data/datasources/remote/auth_remote.datasource.dart';
import '../../../features/auth/data/datasources/remote/auth_remote.datasource.impl.dart';
import '../../../features/auth/data/repository/auth.repository.impl.dart';
import '../../../features/auth/domain/repository/auth.repository.dart';
import '../../../features/auth/domain/usecase/clear_user_data.usecase.dart';
import '../../../features/auth/domain/usecase/login.usecase.dart';
import '../../../features/auth/domain/usecase/user.usecase.dart';
import '../../../features/auth/presentation/bloc/login-bloc/login_bloc.dart';
import '../../../features/auth/presentation/bloc/user-bloc/user_bloc.dart';
import '../../../features/main-feature/data/datasources/main_remote.datasource.dart';
import '../../../features/main-feature/data/datasources/main_remote.datasource.impl.dart';
import '../../../features/main-feature/data/repository/main.repository.impl.dart';
import '../../../features/main-feature/domain/repository/main.repository.dart';
import '../../../features/main-feature/domain/usecase/close_unloading.usecase.dart';
import '../../../features/main-feature/domain/usecase/get_ncp_feedback_location.usecase.dart';
import '../../../features/main-feature/domain/usecase/get_ncp_number.usecase.dart';
import '../../../features/main-feature/domain/usecase/get_ncp_part_data.usecase.dart';
import '../../../features/main-feature/domain/usecase/get_ncp_shortage_problem.usecase.dart';
import '../../../features/main-feature/domain/usecase/location_building.usecase.dart';
import '../../../features/main-feature/domain/usecase/location_section.usecase.dart';
import '../../../features/main-feature/domain/usecase/packing_month.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_high_rack.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_moving_box.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_ncp_number.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_rack_location.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_unloading.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_high_rack.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_moving_box.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_ncp_data.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_unloading.usecase.dart';
import '../../../features/main-feature/domain/usecase/unloading_location.usecase.dart';
import '../../../features/main-feature/domain/usecase/unloading_status.usecase.dart';
import '../../../features/main-feature/domain/usecase/vehicle_data.usecase.dart';
import '../../../features/main-feature/presentation/bloc/get-ncp-number-bloc/get_ncp_number_bloc.dart';
import '../../../features/main-feature/presentation/bloc/location-area-bloc/location_area_bloc.dart';
import '../../../features/main-feature/presentation/bloc/location-building-bloc/location_building_bloc.dart';
import '../../../features/main-feature/presentation/bloc/location-section-bloc/location_section_bloc.dart';
import '../../../features/main-feature/presentation/bloc/ncp-detail-bloc/ncp_detail_bloc.dart';
import '../../../features/main-feature/presentation/bloc/search-high-rack-bloc/search_high_rack_bloc.dart';
import '../../../features/main-feature/presentation/bloc/search-location-rack-bloc/search_location_rack_bloc.dart';
import '../../../features/main-feature/presentation/bloc/search-moving-box-bloc/search_moving_box_bloc.dart';
import '../../../features/main-feature/presentation/bloc/search-ncp-number-bloc/search_ncp_number_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-high-rack-bloc/submit_high_rack_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-moving-box-bloc/submit_moving_box_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-ncp-data-bloc/submit_ncp_data_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-unloading-bloc/submit_unloading_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-bloc/unloading_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-location-bloc/unloading_location_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-status-bloc/unloading_status_bloc.dart';
import '../../../features/main-feature/presentation/cubit/submit-ncp-cubit/submit_ncp_cubit.dart';
import '../../../features/main-feature/presentation/cubit/submit-unloading-cubit/submit_unloading_cubit.dart';
import '../../services/network.dart';

final sl = GetIt.instance;

Future init() async {
  if (kIsWeb) {
    Hive.init('');
  } else {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }
  final authBox = await Hive.openBox("authBox");

  sl.registerLazySingleton<ApiService>(() => ApiService(
        baseUrl: APIConst.authBaseUrl,
      ));

  sl.registerFactory(
    () => SubmitUnloadingCubit(),
  );
  sl.registerFactory(
    () => SubmitMovingBoxCubit(
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerFactory(
    () => SubmitHighRackCubit(),
  );
  sl.registerFactory(
    () => SubmitNcpCubit(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  sl.registerFactory(() => LoginBloc(
        sl(),
      ));
  sl.registerFactory(() => UserBloc(
        sl(),
        sl(),
      ));
  sl.registerFactory(() => UnloadingBloc(
        sl(),
      ));
  sl.registerFactory(() => UnloadingStatusBloc(
        sl(),
      ));
  sl.registerFactory(() => UnloadingLocationBloc(
        sl(),
      ));
  sl.registerFactory(() => SubmitUnloadingBloc(
        sl(),
        sl(),
      ));
  sl.registerFactory(() => LocationAreaBloc(
        sl(),
      ));
  sl.registerFactory(() => LocationBuildingBloc(
        sl(),
      ));
  sl.registerFactory(() => LocationSectionBloc(
        sl(),
      ));
  sl.registerFactory(() => SearchMovingBoxBloc(
        sl(),
      ));
  sl.registerFactory(() => SubmitMovingBoxBloc(
        sl(),
      ));
  sl.registerFactory(() => SearchHighRackBloc(
        sl(),
      ));
  sl.registerFactory(() => SearchLocationRackBloc(
        sl(),
      ));
  sl.registerFactory(() => SubmitHighRackBloc(
        sl(),
      ));
  sl.registerFactory(() => GetNcpNumberBloc(
        sl(),
      ));
  sl.registerFactory(() => SearchNcpNumberBloc(
        sl(),
      ));
  sl.registerFactory(
    () => NcpDetailBloc(),
  );
  sl.registerFactory(() => SubmitNcpDataBloc(
        sl(),
      ));

  sl.registerLazySingleton(() => LoginUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => UserUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => ClearUserDataUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SearchUnloadingUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => UnloadingStatusUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => UnloadingLocationUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SubmitUnloadingUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => CloseUnloadingUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => LocationAreaUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => LocationBuildingUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => LocationSectionUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SearchMovingBoxUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SubmitMovingBoxUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SearchHighRackUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SearchRackLocationUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SubmitHighRackUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => PackingMonthUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => VehicleDataUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => GetNcpNumberUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SearchNcpNumberUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => SubmitNcpDataUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => GetNcpPartDataUseCase(
        sl(),
      ));
  sl.registerLazySingleton(() => ShortAgeProblemUseCase(
        sl(),
      ));

  sl.registerLazySingleton(() => GetNcpFeedBackLocationUseCase(
        sl(),
      ));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(
        sl(),
      ));

  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        sl(),
      ));
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(authBox),
  );
  sl.registerLazySingleton<MainRemoteDataSource>(() => MainRemoteDataSourceImpl(
        ApiService(
          baseUrl: APIConst.apiBaseUrl,
        ),
      ));
}
