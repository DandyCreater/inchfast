part of 'submit_unloading_cubit.dart';

class SubmitUnloadingState extends Equatable {
  final String? id;
  final String? idLocation;
  final int? status;

  const SubmitUnloadingState({
    this.id,
    this.idLocation,
    this.status,
  });

  SubmitUnloadingState copyWith({
    final String? id,
    final String? idLocation,
    final int? status,
  }) {
    return SubmitUnloadingState(
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
