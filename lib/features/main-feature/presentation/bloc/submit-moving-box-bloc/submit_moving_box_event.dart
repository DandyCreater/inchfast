part of 'submit_moving_box_bloc.dart';

sealed class SubmitMovingBoxEvent extends Equatable {
  const SubmitMovingBoxEvent();

  @override
  List<Object> get props => [];
}

class SubmitMovingBox extends SubmitMovingBoxEvent {
  final SubmitMovingBoxParams? params;

  const SubmitMovingBox(this.params);

  @override
  // TODO: implement props
  List<Object> get props => [params!];
}
