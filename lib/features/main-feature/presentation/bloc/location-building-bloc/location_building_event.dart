part of 'location_building_bloc.dart';

sealed class LocationBuildingEvent extends Equatable {
  const LocationBuildingEvent();

  @override
  List<Object> get props => [];
}

class GetLocation extends LocationBuildingEvent {}
