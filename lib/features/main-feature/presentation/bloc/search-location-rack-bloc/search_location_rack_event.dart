part of 'search_location_rack_bloc.dart';

class SearchLocationRackEvent extends Equatable {
  const SearchLocationRackEvent();

  @override
  List<Object> get props => [];
}

class SearchLocationRack extends SearchLocationRackEvent {
  final String? params;

  const SearchLocationRack({required this.params});

  @override
  // TODO: implement props
  List<Object> get props => [params!];
}

class ResetLocationRack extends SearchLocationRackEvent {}
