import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/close_unloading.entity.dart';
import '../../../domain/parameter/submit_unloading.parameter.dart';
import '../../../domain/usecase/close_unloading.usecase.dart';
import '../../../domain/usecase/submit_unloading.usecase.dart';

part 'submit_unloading_event.dart';
part 'submit_unloading_state.dart';

class SubmitUnloadingBloc
    extends Bloc<SubmitUnloadingEvent, SubmitUnloadingState> {
  final SubmitUnloadingUseCase _submitUnloadingUseCase;
  final CloseUnloadingUseCase _closeUnloadingUseCase;
  SubmitUnloadingBloc(this._submitUnloadingUseCase, this._closeUnloadingUseCase)
      : super(SubmitUnloadingInitial()) {
    on<StartSubmitUnloading>((event, emit) async {
      emit(SubmitUnloadingLoading());

      final result = await _submitUnloadingUseCase(SubmitUnloadingParams(
        event.id,
        event.idLocation,
        event.status,
      ));
      result.fold((failure) {
        emit(SubmitUnloadingFailed(failure));
      }, (success) {
        emit(SubmitUnloadingSuccess());
      });
    });

    on<CloseUnloading>((event, emit) async {
      emit(SubmitUnloadingLoading());

      final result = await _closeUnloadingUseCase(event.id ?? "");
      result.fold((failure) {
        emit(CloseUnloadingFailed(failure));
      }, (success) {
        emit(SubmitUnloadingSuccess());
      });
    });
  }
}
