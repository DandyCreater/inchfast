part of 'location_area_bloc.dart';

sealed class LocationAreaEvent extends Equatable {
  const LocationAreaEvent();

  @override
  List<Object> get props => [];
}

class GetLocationArea extends LocationAreaEvent {
  final String? idLocation;

  const GetLocationArea(this.idLocation);

  @override
  // TODO: implement props
  List<Object> get props => [
        idLocation!,
      ];
}
