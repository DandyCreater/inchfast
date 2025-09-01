part of 'submit_unloading_bloc.dart';

class SubmitUnloadingState extends Equatable {
  const SubmitUnloadingState();

  @override
  List<Object> get props => [];
}

class SubmitUnloadingInitial extends SubmitUnloadingState {}

class SubmitUnloadingLoading extends SubmitUnloadingState {}

class SubmitUnloadingSuccess extends SubmitUnloadingState {}

class SubmitUnloadingFailed extends SubmitUnloadingState {
  final String? msg;

  const SubmitUnloadingFailed(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
