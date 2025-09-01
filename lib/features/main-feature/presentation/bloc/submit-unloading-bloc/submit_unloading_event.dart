part of 'submit_unloading_bloc.dart';

class SubmitUnloadingEvent extends Equatable {
  const SubmitUnloadingEvent();

  @override
  List<Object> get props => [];
}

class StartSubmitUnloading extends SubmitUnloadingEvent {
  final String? id;
  final String? idLocation;
  final int? status;

  const StartSubmitUnloading({
    this.id,
    this.idLocation,
    this.status,
  });

  StartSubmitUnloading copyWith({
    final String? id,
    final String? idLocation,
    final int? status,
  }) {
    return StartSubmitUnloading(
      id: id ?? this.id,
      idLocation: idLocation ?? this.idLocation,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id ?? 0,
        status ?? '',
        idLocation ?? '',
      ];
}

class SubmitUnloadingPressed extends SubmitUnloadingEvent {}
