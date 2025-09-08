part of 'unloading_status_bloc.dart';

class UnloadingStatusState extends Equatable {
  const UnloadingStatusState();

  @override
  List<Object> get props => [];
}

class UnloadingStatusInitial extends UnloadingStatusState {}

class UnloadingStatusLoading extends UnloadingStatusState {}

class UnloadingStatusSuccess extends UnloadingStatusState {
  final UnloadingStatusEntity? value;
  final List<DropdownValue> listValue;

  const UnloadingStatusSuccess(
    this.value,
    this.listValue,
  );

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class UnloadingStatusFailed extends UnloadingStatusState {
  final String? msg;

  const UnloadingStatusFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
