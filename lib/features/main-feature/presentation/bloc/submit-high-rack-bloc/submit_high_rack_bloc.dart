import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/submit_high_rack.entity.dart';
import '../../../domain/parameter/submit_high_rack.parameter.dart';
import '../../../domain/usecase/submit_high_rack.usecase.dart';

part 'submit_high_rack_event.dart';
part 'submit_high_rack_state.dart';

class SubmitHighRackBloc
    extends Bloc<SubmitHighRackEvent, SubmitHighRackState> {
  final SubmitHighRackUseCase _submitHighRackUseCase;
  SubmitHighRackBloc(this._submitHighRackUseCase)
      : super(SubmitHighRackInitial()) {
    on<SubmitHighRack>((event, emit) async {
      emit(SubmitHighRackLoading());
      final result = await _submitHighRackUseCase(event.params);

      result.fold((failure) {
        emit(SubmitHighRackFailed(failure));
      }, (success) {
        emit(SubmitHighRackSuccess(success!));
      });
    });
  }
}
