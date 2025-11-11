import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/parameter/submit_moving_box.parameter.dart';
import '../../../domain/usecase/submit_moving_box.usecase.dart';

part 'submit_moving_box_event.dart';
part 'submit_moving_box_state.dart';

class SubmitMovingBoxBloc
    extends Bloc<SubmitMovingBoxEvent, SubmitMovingBoxState> {
  final SubmitMovingBoxUseCase _submitMovingBoxUseCase;
  SubmitMovingBoxBloc(
    this._submitMovingBoxUseCase,
  ) : super(SubmitMovingBoxInitial()) {
    on<SubmitMovingBox>((event, emit) async {
      emit(SubmitMovingBoxLoading());
      final result = await _submitMovingBoxUseCase(event.params!);
      result.fold((failure) {
        emit(SubmitMovingBoxFailed(failure));
      }, (success) {
        emit(SubmitMovingBoxSuccess());
      });
    });
  }
}
