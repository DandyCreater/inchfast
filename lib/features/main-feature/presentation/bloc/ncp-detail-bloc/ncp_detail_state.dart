part of 'ncp_detail_bloc.dart';

class NcpDetailState extends Equatable {
  const NcpDetailState();

  @override
  List<Object> get props => [];
}

class NcpDetailInitial extends NcpDetailState {}

class NcpDetailLoading extends NcpDetailState {}

class NcpDetailSuccess extends NcpDetailState {
  final ListElementEntity? dataValue;

  const NcpDetailSuccess(this.dataValue);

  @override
  // TODO: implement props
  List<Object> get props => [dataValue!];
}

class NcpDetailFailed extends NcpDetailState {
  final String? msg;

  const NcpDetailFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
