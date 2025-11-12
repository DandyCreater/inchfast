import 'package:bloc/bloc.dart';

import '../../../../../core/design_component/dropdown.dart';
import '../../../domain/usecase/location_area.usecase.dart';
import '../../../domain/usecase/location_building.usecase.dart';
import '../../../domain/usecase/location_section.usecase.dart';

part 'submit_moving_box_state.dart';

class SubmitMovingBoxCubit extends Cubit<SubmitMovingBoxState> {
  final LocationAreaUseCase _locationAreaUseCase;
  final LocationBuildingUseCase _locationBuildingUseCase;
  final LocationSectionUseCase _locationSectionUseCase;

  SubmitMovingBoxCubit(
    this._locationAreaUseCase,
    this._locationBuildingUseCase,
    this._locationSectionUseCase,
  ) : super(const SubmitMovingBoxState());

  void setId(String id) {
    emit(state.copyWith(
      id: id,
    ));
  }

  void setIdLocationSection(String idLocationSection) {
    emit(state.copyWith(
      isAbletoSubmit: true,
      idLocationSection: idLocationSection,
    ));
  }

  void setIdLocationBuilding(String idLocationBuilding) {
    emit(state.copyWith(
      idLocationBuilding: idLocationBuilding,
    ));
  }

  void setIdLocationArea(String idLocationArea) {
    emit(state.copyWith(
      idLocationArea: idLocationArea,
    ));
  }

  Future<void> setLocationBuilding() async {
    final result = await _locationBuildingUseCase();
    setIsAbletoSubmit(false);
    result.fold((failure) {}, (success) async {
      List<DropdownValue> listBuildingValue = [];
      List<DropdownValue> listAreaValue = [];
      List<DropdownValue> listSectionValue = [];

      if (success != null && success.list!.isNotEmpty) {
        listBuildingValue = success.list!.map((data) {
          return DropdownValue(id: data.id, label: data.name);
        }).toList();

        emit(state.copyWith(
            locationBuildingData: listBuildingValue,
            locationSectionData: [
              const DropdownValue(
                id: '',
                label: '',
              ),
            ],
            locationAreaData: [
              const DropdownValue(
                id: '',
                label: '',
              ),
            ]));

        final areaRes = await _locationAreaUseCase(
          success.list!.first.id ?? '',
        );
        areaRes.fold((failure) {}, (areaSuccess) async {
          if (areaSuccess != null && areaSuccess.list!.isNotEmpty) {
            listAreaValue = areaSuccess.list!.map((data) {
              return DropdownValue(id: data.id, label: data.name);
            }).toList();

            emit(state.copyWith(
              locationAreaData: listAreaValue,
            ));

            final sectionRes =
                await _locationSectionUseCase(areaSuccess.list!.first.id);
            sectionRes.fold((failure) {}, (sectionSuccess) {
              if (sectionSuccess != null && sectionSuccess.list!.isNotEmpty) {
                listSectionValue = sectionSuccess.list!.map((data) {
                  return DropdownValue(id: data.id, label: data.name);
                }).toList();

                emit(state.copyWith(
                  idLocationSection: listSectionValue.first.id,
                  isAbletoSubmit: true,
                  locationSectionData: listSectionValue,
                ));
              } else {
                emit(state.copyWith(locationSectionData: [
                  const DropdownValue(
                    id: '',
                    label: '',
                  ),
                ]));
              }
            });
          } else {
            emit(state.copyWith(locationAreaData: [
              const DropdownValue(
                id: '',
                label: '',
              )
            ], locationSectionData: [
              const DropdownValue(
                id: '',
                label: '',
              ),
            ]));
          }
        });
      }
    });
  }

  Future<void> setLocationSection(
    String idLocationArea,
  ) async {
    final result = await _locationSectionUseCase(idLocationArea);
    setIsAbletoSubmit(false);
    result.fold((failure) {}, (success) {
      List<DropdownValue> listValue = [];
      if (success != null && success.list!.isNotEmpty) {
        listValue = success.list!.map((data) {
          return DropdownValue(id: data.id, label: data.name);
        }).toList();
        emit(state.copyWith(
          isAbletoSubmit: true,
          locationSectionData: listValue,
          idLocationSection: listValue.first.id,
        ));
      } else {
        emit(state.copyWith(
          locationSectionData: [
            const DropdownValue(
              id: '',
              label: '',
            )
          ],
        ));
      }
    });
  }

  Future<void> setLocationArea(String idLocationBuilding) async {
    final result = await _locationAreaUseCase(idLocationBuilding);
    result.fold((failure) {}, (success) {
      List<DropdownValue> listValue = [];
      if (success != null && success.list!.isNotEmpty) {
        listValue = success.list!.map((data) {
          return DropdownValue(id: data.id, label: data.name);
        }).toList();
      }
      emit(state.copyWith(
        locationSectionData: [
          const DropdownValue(
            id: "",
            label: "",
          )
        ],
        locationAreaData: listValue,
      ));
    });
  }

  void setIsAbletoSubmit(bool choice) {
    emit(state.copyWith(
      isAbletoSubmit: choice,
    ));
  }

  void resetValue() {
    emit(state.copyWith(
        id: '',
        idLocationSection: '',
        isAbletoSubmit: false,
        locationAreaData: [
          const DropdownValue(
            id: '',
            label: '',
          )
        ],
        locationSectionData: [
          const DropdownValue(
            id: '',
            label: '',
          ),
        ],
        locationBuildingData: [
          const DropdownValue(
            id: '',
            label: '',
          ),
        ]));
  }
}
