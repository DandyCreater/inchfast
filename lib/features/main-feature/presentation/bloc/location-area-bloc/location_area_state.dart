part of 'location_area_bloc.dart';

class LocationAreaState extends Equatable {
  const LocationAreaState();

  @override
  List<Object> get props => [];
}

class LocationAreaInitial extends LocationAreaState {}

class LocationAreaLoading extends LocationAreaState {}

class LocationAreaSuccess extends LocationAreaState {
  final LocationAreaEntity? value;

  const LocationAreaSuccess(
    this.value,
  );

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class LocationAreaFailed extends LocationAreaState {
  final String? msg;

  const LocationAreaFailed(
    this.msg,
  );

  @override
  // TODO: implement props
  List<Object> get props => [
        msg!,
      ];
}
