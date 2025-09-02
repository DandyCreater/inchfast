part of 'search_location_rack_bloc.dart';

class SearchLocationRackState extends Equatable {
  const SearchLocationRackState();

  @override
  List<Object> get props => [];
}

class SearchLocationRackInitial extends SearchLocationRackState {}

class SearchLocationRackLoading extends SearchLocationRackState {}

class SearchLocationRackSuccess extends SearchLocationRackState {
  final LocationRackEntity? value;

  const SearchLocationRackSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class SearchLocationRackFailed extends SearchLocationRackState {
  final String? msg;

  const SearchLocationRackFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
