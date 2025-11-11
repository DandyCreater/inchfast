part of 'get_ncp_number_bloc.dart';

class GetNcpNumberState extends Equatable {
  const GetNcpNumberState();

  @override
  List<Object> get props => [];
}

class GetNcpNumberInitial extends GetNcpNumberState {}

class GetNcpNumberLoading extends GetNcpNumberState {}

class GetNcpNumberSuccess extends GetNcpNumberState {
  final NcpNumberEntity? value;

  const GetNcpNumberSuccess(this.value);

  @override
  List<Object> get props => [value!];
}

class GetNcpNumberFailed extends GetNcpNumberState {}
