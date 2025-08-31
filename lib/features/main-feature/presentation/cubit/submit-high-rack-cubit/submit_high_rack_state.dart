part of 'submit_high_rack_cubit.dart';

class SubmitHighRackState {
  final String? id;
  final String? newId;
  final String? rackCode;
  final bool? isAbletoSubmit;

  const SubmitHighRackState({
    this.id,
    this.newId,
    this.rackCode,
    this.isAbletoSubmit = false,
  });

  SubmitHighRackState copyWith({
    final String? id,
    final String? newId,
    final String? rackCode,
    final bool? isAbletoSubmit,
  }) {
    return SubmitHighRackState(
      id: id ?? this.id,
      newId: newId ?? this.newId,
      rackCode: rackCode ?? this.rackCode,
      isAbletoSubmit: isAbletoSubmit ?? this.isAbletoSubmit,
    );
  }
}
