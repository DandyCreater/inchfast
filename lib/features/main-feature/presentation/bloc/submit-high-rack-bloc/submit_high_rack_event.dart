part of 'submit_high_rack_bloc.dart';

class SubmitHighRackEvent extends Equatable {
  const SubmitHighRackEvent();

  @override
  List<Object> get props => [];
}

class SubmitHighRack extends SubmitHighRackEvent {
  final SubmitHighRackParameter params;

  const SubmitHighRack(this.params);

  @override
  // TODO: implement props
  List<Object> get props => [params];
}
