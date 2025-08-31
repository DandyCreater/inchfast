import 'package:dartz/dartz.dart';
import '../../domain/entity/login.entity.dart';
import '../../domain/parameter/login.parameter.dart';
import '../../domain/repository/auth.repository.dart';
import '../datasources/local/auth_local.datasource.dart';
import '../datasources/remote/auth_remote.datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<String, LoginEntity?>> login(LoginParameter params) async {
    final result = await _remoteDataSource.login(params);
    if (result != null && result.code == 200) {
      await _localDataSource.saveUserData(result);
      return right(result.toEntity());
    } else {
      return left(result?.message ?? 'Something Wrong');
    }
  }

  @override
  Future<void> deleteUserData() async {
    await _localDataSource.deleteUserData();
  }

  @override
  Future<LoginEntity?> getUserData() async {
    final result = await _localDataSource.getUserData();
    if (result != null) {
      return result.toEntity();
    } else {
      return null;
    }
  }
}
