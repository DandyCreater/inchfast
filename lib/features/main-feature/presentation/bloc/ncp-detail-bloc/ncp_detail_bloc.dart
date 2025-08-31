import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/ncp_part_number.entity.dart';

part 'ncp_detail_event.dart';
part 'ncp_detail_state.dart';

class NcpDetailBloc extends Bloc<NcpDetailEvent, NcpDetailState> {
  NcpDetailBloc() : super(NcpDetailInitial()) {
    on<FilterNcpNumber>((event, emit) async {
      emit(NcpDetailLoading());
      await Future.delayed(const Duration(milliseconds: 300));

      final result =
          event.loadData!.list!.where((x) => x.lot == event.lotData).toList();

      emit(NcpDetailSuccess(
        (result.isNotEmpty) ? result.first : null,
      ));
    });
  }
}
