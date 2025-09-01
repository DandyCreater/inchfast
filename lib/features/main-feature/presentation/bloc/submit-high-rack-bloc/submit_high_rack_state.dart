part of 'submit_high_rack_bloc.dart';

class SubmitHighRackState extends Equatable {
  const SubmitHighRackState();

  @override
  List<Object> get props => [];
}

class SubmitHighRackInitial extends SubmitHighRackState {}

class SubmitHighRackLoading extends SubmitHighRackState {}

class SubmitHighRackSuccess extends SubmitHighRackState {
  final SubmitHighRackEntity value;

  const SubmitHighRackSuccess(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value];
}

class SubmitHighRackFailed extends SubmitHighRackState {
  final String? msg;

  const SubmitHighRackFailed(this.msg);
}
