part of 'location_building_bloc.dart';

class LocationBuildingState extends Equatable {
  const LocationBuildingState();

  @override
  List<Object> get props => [];
}

class LocationBuildingInitial extends LocationBuildingState {}

class LocationBuildingLoading extends LocationBuildingState {}

class LocationBuildingSuccess extends LocationBuildingState {
  final LocationBuildingEntity? value;

  const LocationBuildingSuccess(this.value);
}

class LocationBuildingFailed extends LocationBuildingState {
  final String? msg;

  const LocationBuildingFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
