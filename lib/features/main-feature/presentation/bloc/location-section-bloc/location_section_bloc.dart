import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/location_section.entity.dart';
import '../../../domain/usecase/location_section.usecase.dart';

part 'location_section_event.dart';
part 'location_section_state.dart';

class LocationSectionBloc
    extends Bloc<LocationSectionEvent, LocationSectionState> {
  final LocationSectionUseCase _locationSectionUseCase;
  LocationSectionBloc(
    this._locationSectionUseCase,
  ) : super(LocationSectionInitial()) {
    on<GetLocationSection>((event, emit) async {
      emit(LocationSectionLoading());
      final result = await _locationSectionUseCase(
        event.idArea ?? '',
      );
      result.fold((failure) {
        emit(LocationSectionFailed(
          failure,
        ));
      }, (success) {
        emit(LocationSectionSuccess(success));
      });
    });
  }
}
