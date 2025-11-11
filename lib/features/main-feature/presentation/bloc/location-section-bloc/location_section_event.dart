part of 'location_section_bloc.dart';

class LocationSectionEvent extends Equatable {
  const LocationSectionEvent();

  @override
  List<Object> get props => [];
}

class GetLocationSection extends LocationSectionEvent {
  final String? idArea;

  const GetLocationSection({
    this.idArea,
  });

  @override
  // TODO: implement props
  List<Object> get props => [idArea!];
}
