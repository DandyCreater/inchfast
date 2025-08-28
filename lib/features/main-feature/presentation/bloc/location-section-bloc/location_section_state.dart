part of 'location_section_bloc.dart';

class LocationSectionState extends Equatable {
  const LocationSectionState();

  @override
  List<Object> get props => [];
}

class LocationSectionInitial extends LocationSectionState {}

class LocationSectionLoading extends LocationSectionState {}

class LocationSectionSuccess extends LocationSectionState {
  final LocationSectionEntity? value;

  const LocationSectionSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class LocationSectionFailed extends LocationSectionState {
  final String? msg;

  const LocationSectionFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [
        msg!,
      ];
}
