part of 'search_high_rack_bloc.dart';

class SearchHighRackState extends Equatable {
  const SearchHighRackState();

  @override
  List<Object> get props => [];
}

class SearchHighRackInitial extends SearchHighRackState {}

class SearchHighRackLoading extends SearchHighRackState {}

class SearchHighRackSuccess extends SearchHighRackState {
  final HighRackEntity? value;

  const SearchHighRackSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class SearchHighRackFailed extends SearchHighRackState {
  final String? msg;

  const SearchHighRackFailed(this.msg);
  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
