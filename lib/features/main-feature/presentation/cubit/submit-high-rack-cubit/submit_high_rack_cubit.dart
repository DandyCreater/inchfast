import 'package:bloc/bloc.dart';

part 'submit_high_rack_state.dart';

class SubmitHighRackCubit extends Cubit<SubmitHighRackState> {
  SubmitHighRackCubit()
      : super(
          const SubmitHighRackState(),
        );

  void setId({String? id, String? rackCode}) {
    emit(state.copyWith(
      id: id,
      rackCode: rackCode,
    ));
  }

  void setnewId({String? newId, String? newRackCode}) {
    String rackCode = state.rackCode ?? '';
    emit(state.copyWith(
      newId: newId,
      isAbletoSubmit: (newRackCode != rackCode) ? true : false,
    ));
  }

  void resetValue() {
    emit(state.copyWith(
      id: '',
      newId: '',
      rackCode: '',
      isAbletoSubmit: false,
    ));
  }
}
