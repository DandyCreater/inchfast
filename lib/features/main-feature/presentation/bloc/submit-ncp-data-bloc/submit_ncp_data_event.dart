part of 'submit_ncp_data_bloc.dart';

class SubmitNcpDataEvent extends Equatable {
  const SubmitNcpDataEvent();

  @override
  List<Object> get props => [];
}

class SubmitNcpData extends SubmitNcpDataEvent {
  final AddNcpParameter params;

  const SubmitNcpData(this.params);

  @override
  List<Object> get props => [params];
}
