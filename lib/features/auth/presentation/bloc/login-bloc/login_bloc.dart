import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inchfast/features/auth/domain/usecase/login.usecase.dart';

import '../../../domain/entity/login.entity.dart';
import '../../../domain/parameter/login.parameter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<StartLogin>((event, emit) async {
      emit(LoginLoading());

      final result = await _loginUseCase(event.params);
      result.fold((failure) {
        emit(
          LoginFailed(failure),
        );
      }, (success) {
        emit(LoginSuccess(value: success));
      });
    });
  }
}
