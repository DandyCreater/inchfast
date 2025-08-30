import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/unloading.entity.dart';
import '../../../domain/usecase/search_unloading.usecase.dart';

part 'unloading_event.dart';
part 'unloading_state.dart';

class UnloadingBloc extends Bloc<UnloadingEvent, UnloadingState> {
  SearchUnloadingUseCase _searchUnloadingUseCase;
  UnloadingBloc(
    this._searchUnloadingUseCase,
  ) : super(UnloadingInitial()) {
    on<SearchUnloading>((event, emit) async {
      emit(UnloadingLoading());
      final result = await _searchUnloadingUseCase(
        event.params ?? '',
      );
      result.fold((failure) {
        emit(UnloadingFailed(
          msg: failure,
        ));
      }, (success) {
        emit(UnloadingSuccess(
          success,
        ));
      });
    });
  }
}
