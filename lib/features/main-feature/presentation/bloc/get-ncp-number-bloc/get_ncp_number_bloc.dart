import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/ncp_number.entity.dart';
import '../../../domain/usecase/get_ncp_number.usecase.dart';

part 'get_ncp_number_event.dart';
part 'get_ncp_number_state.dart';

class GetNcpNumberBloc extends Bloc<GetNcpNumberEvent, GetNcpNumberState> {
  final GetNcpNumberUseCase _getNcpNumberUseCase;
  GetNcpNumberBloc(this._getNcpNumberUseCase) : super(GetNcpNumberInitial()) {
    on<LoadNcpNumber>((event, emit) async {
      emit(GetNcpNumberLoading());
      final result = await _getNcpNumberUseCase();
      result.fold((failure) {
        emit(GetNcpNumberFailed());
      }, (success) {
        emit(GetNcpNumberSuccess(
          success,
        ));
      });
    });
  }
}
