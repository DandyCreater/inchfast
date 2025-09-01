import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/design_component/dropdown.dart';
import '../../../domain/entity/unloading_status.entity.dart';
import '../../../domain/usecase/unloading_status.usecase.dart';

part 'unloading_status_event.dart';
part 'unloading_status_state.dart';

class UnloadingStatusBloc
    extends Bloc<UnloadingStatusEvent, UnloadingStatusState> {
  final UnloadingStatusUseCase _unloadingStatusUseCase;
  UnloadingStatusBloc(this._unloadingStatusUseCase)
      : super(UnloadingStatusInitial()) {
    on<GetStatusData>((event, emit) async {
      emit(UnloadingStatusLoading());
      final result = await _unloadingStatusUseCase();
      result.fold((failure) {
        emit(UnloadingStatusFailed(failure));
      }, (success) {
        List<DropdownValue> valueData = [];
        valueData = success!.list!.map((x) {
          return DropdownValue(id: x.id.toString(), label: x.nama);
        }).toList();
        emit(UnloadingStatusSuccess(
          success,
          valueData,
        ));
      });
    });
  }
}
