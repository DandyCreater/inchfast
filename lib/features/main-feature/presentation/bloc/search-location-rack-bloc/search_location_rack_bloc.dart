import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/location_rack.entity.dart';
import '../../../domain/usecase/search_rack_location.usecase.dart';

part 'search_location_rack_event.dart';
part 'search_location_rack_state.dart';

class SearchLocationRackBloc
    extends Bloc<SearchLocationRackEvent, SearchLocationRackState> {
  final SearchRackLocationUseCase _searchRackLocationUseCase;
  SearchLocationRackBloc(this._searchRackLocationUseCase)
      : super(SearchLocationRackInitial()) {
    on<SearchLocationRack>((event, emit) async {
      emit(SearchLocationRackLoading());
      final result = await _searchRackLocationUseCase(event.params!);
      result.fold((failure) {
        emit(SearchLocationRackFailed(failure));
      }, (success) {
        emit(SearchLocationRackSuccess(success));
      });
    });

    on<ResetLocationRack>((event, emit) async {
      emit(SearchLocationRackInitial());
    });
  }
}
