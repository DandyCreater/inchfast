part of 'search_ncp_number_bloc.dart';

class SearchNcpNumberEvent extends Equatable {
  const SearchNcpNumberEvent();

  @override
  List<Object> get props => [];
}

class SearchNcpNumber extends SearchNcpNumberEvent {
  final NcpPartNumberParameter? params;
  const SearchNcpNumber({
    this.params,
  });

  @override
  List<Object> get props => [params!];
}
