part of 'submit_moving_box_bloc.dart';

class SubmitMovingBoxState extends Equatable {
  const SubmitMovingBoxState();

  @override
  List<Object> get props => [];
}

class SubmitMovingBoxInitial extends SubmitMovingBoxState {}

class SubmitMovingBoxLoading extends SubmitMovingBoxState {}

class SubmitMovingBoxSuccess extends SubmitMovingBoxState {}

class SubmitMovingBoxFailed extends SubmitMovingBoxState {
  final String? msg;

  const SubmitMovingBoxFailed(this.msg);
}
