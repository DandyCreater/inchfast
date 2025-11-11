import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/ncp_part_number.entity.dart';
import '../../../domain/parameter/ncp_part_number.parameter.dart';
import '../../../domain/usecase/search_ncp_number.usecase.dart';

part 'search_ncp_number_event.dart';
part 'search_ncp_number_state.dart';

class SearchNcpNumberBloc
    extends Bloc<SearchNcpNumberEvent, SearchNcpNumberState> {
  final SearchNcpNumberUseCase _searchNcpNumberUseCase;
  SearchNcpNumberBloc(this._searchNcpNumberUseCase)
      : super(SearchNcpNumberInitial()) {
    on<SearchNcpNumber>((event, emit) async {
      emit(SearchNcpNumberLoading());

      final result = await _searchNcpNumberUseCase(event.params!);
      result.fold((failure) {
        emit(SearchNcpNumberFailed(failure));
      }, (success) {
        emit(SearchNcpNumberSuccess(
          success,
        ));
      });
    });
  }
}
