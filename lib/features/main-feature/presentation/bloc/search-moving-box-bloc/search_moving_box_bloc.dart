import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/moving_box.entity.dart';
import '../../../domain/usecase/search_moving_box.usecase.dart';

part 'search_moving_box_event.dart';
part 'search_moving_box_state.dart';

class SearchMovingBoxBloc
    extends Bloc<SearchMovingBoxEvent, SearchMovingBoxState> {
  final SearchMovingBoxUseCase _searchMovingBoxUseCase;
  SearchMovingBoxBloc(
    this._searchMovingBoxUseCase,
  ) : super(SearchMovingBoxInitial()) {
    on<SearchMovingBox>((event, emit) async {
      emit(SearchMovingBoxLoading());
      final result = await _searchMovingBoxUseCase(
        event.params ?? '',
      );
      result.fold((failure) {
        emit(SearchMovingBoxFailed(
          failure,
        ));
      }, (success) {
        emit(SearchMovingBoxSuccess(
          success!,
        ));
      });
    });
  }
}
