part of 'search_ncp_number_bloc.dart';

sealed class SearchNcpNumberState extends Equatable {
  const SearchNcpNumberState();

  @override
  List<Object> get props => [];
}

class SearchNcpNumberInitial extends SearchNcpNumberState {}

class SearchNcpNumberLoading extends SearchNcpNumberState {}

class SearchNcpNumberSuccess extends SearchNcpNumberState {
  final NcpPartNumberEntity? value;

  const SearchNcpNumberSuccess(
    this.value,
  );

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class SearchNcpNumberFailed extends SearchNcpNumberState {
  final String? msg;

  const SearchNcpNumberFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
