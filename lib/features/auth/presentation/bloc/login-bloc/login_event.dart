part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class StartLogin extends LoginEvent {
  final LoginParameter params;

  const StartLogin({required this.params});

  @override
  // TODO: implement props
  List<Object> get props => [params];
}
