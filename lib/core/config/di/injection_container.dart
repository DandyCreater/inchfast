import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:inchfast/core/constants/api.const.dart';
import 'package:inchfast/features/main-feature/domain/usecase/location_area.usecase.dart';
import 'package:inchfast/features/main-feature/presentation/cubit/submit-moving-box-cubit/submit_moving_box_cubit.dart';

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
import '../../../features/main-feature/domain/usecase/location_building.usecase.dart';
import '../../../features/main-feature/domain/usecase/location_section.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_moving_box.usecase.dart';
import '../../../features/main-feature/domain/usecase/search_unloading.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_moving_box.usecase.dart';
import '../../../features/main-feature/domain/usecase/submit_unloading.usecase.dart';
import '../../../features/main-feature/domain/usecase/unloading_location.usecase.dart';
import '../../../features/main-feature/domain/usecase/unloading_status.usecase.dart';
import '../../../features/main-feature/presentation/bloc/location-area-bloc/location_area_bloc.dart';
import '../../../features/main-feature/presentation/bloc/location-building-bloc/location_building_bloc.dart';
import '../../../features/main-feature/presentation/bloc/location-section-bloc/location_section_bloc.dart';
import '../../../features/main-feature/presentation/bloc/search-moving-box-bloc/search_moving_box_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-moving-box-bloc/submit_moving_box_bloc.dart';
import '../../../features/main-feature/presentation/bloc/submit-unloading-bloc/submit_unloading_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-bloc/unloading_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-location-bloc/unloading_location_bloc.dart';
import '../../../features/main-feature/presentation/bloc/unloading-status-bloc/unloading_status_bloc.dart';
import '../../../features/main-feature/presentation/cubit/submit-unloading-cubit/submit_unloading_cubit.dart';
import '../../services/network.dart';

final sl = GetIt.instance;

Future init() async {
  Hive.init('');
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
