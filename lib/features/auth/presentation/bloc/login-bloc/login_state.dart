part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity? value;

  const LoginSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [
        value!,
      ];
}

class LoginFailed extends LoginState {
  final String? msg;
  const LoginFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
