import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/high_rack.entity.dart';
import '../../../domain/usecase/search_high_rack.usecase.dart';

part 'search_high_rack_event.dart';
part 'search_high_rack_state.dart';

class SearchHighRackBloc
    extends Bloc<SearchHighRackEvent, SearchHighRackState> {
  final SearchHighRackUseCase _searchHighRackUseCase;
  SearchHighRackBloc(this._searchHighRackUseCase)
      : super(SearchHighRackInitial()) {
    on<SearchHighRack>((event, emit) async {
      emit(SearchHighRackLoading());
      final result = await _searchHighRackUseCase(event.params!);
      result.fold((failure) {
        emit(SearchHighRackFailed(
          failure,
        ));
      }, (success) {
        emit(SearchHighRackSuccess(
          success,
        ));
      });
    });

    on<ResetRack>((event, emit) async {
      emit(SearchHighRackInitial());
    });
  }
}
