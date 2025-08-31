import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/location_building.entity.dart';
import '../../../domain/usecase/location_building.usecase.dart';

part 'location_building_event.dart';
part 'location_building_state.dart';

class LocationBuildingBloc
    extends Bloc<LocationBuildingEvent, LocationBuildingState> {
  final LocationBuildingUseCase _locationBuildingUseCase;
  LocationBuildingBloc(
    this._locationBuildingUseCase,
  ) : super(LocationBuildingInitial()) {
    on<GetLocation>((event, emit) async {
      emit(LocationBuildingLoading());
      final result = await _locationBuildingUseCase();
      result.fold((failure) {
        emit(LocationBuildingFailed(
          failure,
        ));
      }, (success) {
        emit(LocationBuildingSuccess(
          success,
        ));
      });
    });
  }
}
