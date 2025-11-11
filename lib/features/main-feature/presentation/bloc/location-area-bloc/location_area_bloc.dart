import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/location_area.entity.dart';
import '../../../domain/usecase/location_area.usecase.dart';

part 'location_area_event.dart';
part 'location_area_state.dart';

class LocationAreaBloc extends Bloc<LocationAreaEvent, LocationAreaState> {
  final LocationAreaUseCase _locationAreaUseCase;
  LocationAreaBloc(
    this._locationAreaUseCase,
  ) : super(LocationAreaInitial()) {
    on<GetLocationArea>((event, emit) async {
      emit(LocationAreaLoading());
      final result = await _locationAreaUseCase(
        event.idLocation ?? '',
      );

      result.fold((failure) {
        emit(
          LocationAreaFailed(failure),
        );
      }, (success) {
        emit(LocationAreaSuccess(
          success,
        ));
      });
    });
  }
}
