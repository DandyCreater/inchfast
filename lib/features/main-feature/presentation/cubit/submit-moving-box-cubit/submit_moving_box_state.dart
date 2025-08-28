part of 'submit_moving_box_cubit.dart';

class SubmitMovingBoxState {
  final String? id;
  final String? idLocationSection;
  final String? idLocationBuilding;
  final String? idLocationArea;
  final List<DropdownValue>? locationBuildingData;
  final List<DropdownValue>? locationAreaData;
  final List<DropdownValue>? locationSectionData;
  final bool? isAbletoSubmit;

  const SubmitMovingBoxState({
    this.id,
    this.idLocationSection,
    this.idLocationArea,
    this.idLocationBuilding,
    this.locationAreaData = const [
      DropdownValue(
        id: "",
        label: "",
      )
    ],
    this.locationBuildingData = const [
      DropdownValue(
        id: "",
        label: "",
      )
    ],
    this.locationSectionData = const [
      DropdownValue(
        id: "",
        label: "",
      ),
    ],
    this.isAbletoSubmit = false,
  });

  SubmitMovingBoxState copyWith({
    final String? id,
    final String? idLocationSection,
    final String? idLocationBuilding,
    final String? idLocationArea,
    final List<DropdownValue>? locationBuildingData,
    final List<DropdownValue>? locationAreaData,
    final List<DropdownValue>? locationSectionData,
    final bool? isAbletoSubmit,
  }) {
    return SubmitMovingBoxState(
      id: id ?? this.id,
      idLocationSection: idLocationSection ?? this.idLocationSection,
      idLocationArea: idLocationArea ?? this.idLocationArea,
      idLocationBuilding: idLocationBuilding ?? this.idLocationBuilding,
      locationAreaData: locationAreaData ?? this.locationAreaData,
      locationBuildingData: locationBuildingData ?? this.locationBuildingData,
      locationSectionData: locationSectionData ?? this.locationSectionData,
      isAbletoSubmit: isAbletoSubmit ?? this.isAbletoSubmit,
    );
  }
}
