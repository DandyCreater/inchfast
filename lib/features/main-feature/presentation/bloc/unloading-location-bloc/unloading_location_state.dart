part of 'unloading_location_bloc.dart';

class UnloadingLocationState extends Equatable {
  const UnloadingLocationState();

  @override
  List<Object> get props => [];
}

class UnloadingLocationInitial extends UnloadingLocationState {}

class UnloadingLocationLoading extends UnloadingLocationState {}

class UnloadingLocationSuccess extends UnloadingLocationState {
  final UnloadingLocationEntity? value;
  final List<DropdownValue> listValue;

  const UnloadingLocationSuccess(this.listValue, this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value!, listValue];
}

class UnloadingLocationFailed extends UnloadingLocationState {
  final String? msg;

  const UnloadingLocationFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
