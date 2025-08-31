import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'submit_unloading_state.dart';

class SubmitUnloadingCubit extends Cubit<SubmitUnloadingState> {
  SubmitUnloadingCubit() : super(const SubmitUnloadingState());

  void setIdFzNoComplete(String id) {
    emit(state.copyWith(id: id));
  }

  void setIdLocation(String idLocation) {
    emit(state.copyWith(
      idLocation: idLocation,
    ));
  }

  void setStatus(int status) {
    emit(state.copyWith(
      status: status,
    ));
  }

  void resetValue() {
    emit(state.copyWith(
      id: '',
      idLocation: '',
      status: 0,
    ));
  }
}
