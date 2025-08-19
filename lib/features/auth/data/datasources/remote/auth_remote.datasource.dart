import '../../../domain/parameter/login.parameter.dart';
import '../../model/login.model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel?> login(LoginParameter params);
}
