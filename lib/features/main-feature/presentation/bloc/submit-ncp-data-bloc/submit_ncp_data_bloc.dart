import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/submit_ncp.entity.dart';
import '../../../domain/parameter/submit_ncp.parameter.dart';
import '../../../domain/usecase/submit_ncp_data.usecase.dart';

part 'submit_ncp_data_event.dart';
part 'submit_ncp_data_state.dart';

class SubmitNcpDataBloc extends Bloc<SubmitNcpDataEvent, SubmitNcpDataState> {
  final SubmitNcpDataUseCase _submitNcpDataUseCase;
  SubmitNcpDataBloc(this._submitNcpDataUseCase)
      : super(SubmitNcpDataInitial()) {
    on<SubmitNcpData>((event, emit) async {
      emit(SubmitNcpDataLoading());
      final result = await _submitNcpDataUseCase(event.params);
      result.fold((failure) {
        emit(SubmitNcpDataFailed(failure));
      }, (success) {
        emit(SubmitNcpDataSuccess(success));
      });
    });
  }
}
