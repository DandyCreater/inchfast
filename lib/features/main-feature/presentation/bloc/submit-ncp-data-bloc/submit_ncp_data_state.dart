part of 'submit_ncp_data_bloc.dart';

class SubmitNcpDataState extends Equatable {
  const SubmitNcpDataState();

  @override
  List<Object> get props => [];
}

class SubmitNcpDataInitial extends SubmitNcpDataState {}

class SubmitNcpDataLoading extends SubmitNcpDataState {}

class SubmitNcpDataSuccess extends SubmitNcpDataState {
  final SubmitNcpEntity? value;

  const SubmitNcpDataSuccess(this.value);

  @override
  List<Object> get props => [value!];
}

class SubmitNcpDataFailed extends SubmitNcpDataState {
  final String? msg;

  const SubmitNcpDataFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
