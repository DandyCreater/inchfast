part of 'unloading_status_bloc.dart';

sealed class UnloadingStatusEvent extends Equatable {
  const UnloadingStatusEvent();

  @override
  List<Object> get props => [];
}

class GetStatusData extends UnloadingStatusEvent {}
