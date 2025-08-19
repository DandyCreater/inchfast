import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/design_component/dropdown.dart';
import '../../../domain/entity/unloading_location.entity.dart';
import '../../../domain/usecase/unloading_location.usecase.dart';

part 'unloading_location_event.dart';
part 'unloading_location_state.dart';

class UnloadingLocationBloc
    extends Bloc<UnloadingLocationEvent, UnloadingLocationState> {
  final UnloadingLocationUseCase _unloadingLocationUseCase;
  UnloadingLocationBloc(this._unloadingLocationUseCase)
      : super(UnloadingLocationInitial()) {
    on<GetUnloadingLocation>((event, emit) async {
      emit(UnloadingLocationLoading());
      final result = await _unloadingLocationUseCase();
      result.fold((failure) {
        emit(UnloadingLocationFailed(failure));
      }, (success) {
        List<DropdownValue> listValue = [];
        listValue = success!.list!.map((x) {
          return DropdownValue(
            id: x.id,
            label: x.name,
          );
        }).toList();
        emit(UnloadingLocationSuccess(
          listValue,
          success,
        ));
      });
    });
  }
}
