part of 'search_high_rack_bloc.dart';

class SearchHighRackEvent extends Equatable {
  const SearchHighRackEvent();

  @override
  List<Object> get props => [];
}

class SearchHighRack extends SearchHighRackEvent {
  final String? params;

  const SearchHighRack({required this.params});

  @override
  // TODO: implement props
  List<Object> get props => [params!];
}

class ResetRack extends SearchHighRackEvent {}
