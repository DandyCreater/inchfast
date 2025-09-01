part of 'unloading_bloc.dart';

class UnloadingState extends Equatable {
  const UnloadingState();

  @override
  List<Object> get props => [];
}

class UnloadingInitial extends UnloadingState {}

class UnloadingLoading extends UnloadingState {}

class UnloadingSuccess extends UnloadingState {
  final UnloadingEntity? value;

  const UnloadingSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [
        value!,
      ];
}

class UnloadingFailed extends UnloadingState {
  final String? msg;

  const UnloadingFailed({this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [
        msg!,
      ];
}
