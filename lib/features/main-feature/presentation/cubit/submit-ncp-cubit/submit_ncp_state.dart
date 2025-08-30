part of 'submit_ncp_cubit.dart';

class SubmitNcpState {
  final String? selectedMonth;
  final String? selectedVehicle;
  final List<DropdownValue>? packingMonth;
  final List<DropdownValue>? vehicleData;
  final List<DropdownValue>? parTypeData;
  final List<DropdownValue>? shortAgeData;
  final List<DropdownValue>? ncpFeedBackLocationData;
  final String? partNumber;
  final bool? isAbletoSearch;
  final String? commissionForm;
  final String? commissionTo;
  final String? productionNoForm;
  final String? productionNoTo;
  final String? es1;
  final String? es2;
  final String? fzNo;
  final String? intColor;
  final String? paintColor;
  final String? location;
  final String? packageIdentification;
  final String? idShortageProblem;
  final int? quantity;
  final int? lot;
  final String? idNcpFeedbackLocation;
  final String? idNcpPartType;
  final String? prefixNo;

  const SubmitNcpState({
    this.packingMonth,
    this.vehicleData,
    this.selectedMonth,
    this.selectedVehicle,
    this.parTypeData,
    this.shortAgeData,
    this.ncpFeedBackLocationData,
    this.partNumber,
    this.isAbletoSearch = false,
    this.commissionForm,
    this.commissionTo,
    this.es1,
    this.es2,
    this.fzNo,
    this.idNcpFeedbackLocation,
    this.idNcpPartType,
    this.idShortageProblem,
    this.intColor,
    this.location,
    this.lot,
    this.packageIdentification,
    this.paintColor,
    this.prefixNo,
    this.productionNoForm,
    this.productionNoTo,
    this.quantity,
  });

  SubmitNcpState copyWith({
    String? selectedMonth,
    String? selectedVehicle,
    List<DropdownValue>? packingMonth,
    List<DropdownValue>? vehicleData,
    List<DropdownValue>? parTypeData,
    List<DropdownValue>? shortAgeData,
    List<DropdownValue>? ncpFeedBackLocationData,
    String? partNumber,
    bool? isAbletoSearch,
    String? commissionForm,
    String? commissionTo,
    String? productionNoForm,
    String? productionNoTo,
    String? es1,
    String? es2,
    String? fzNo,
    String? intColor,
    String? paintColor,
    String? location,
    String? packageIdentification,
    String? idShortageProblem,
    int? quantity,
    int? lot,
    String? idNcpFeedbackLocation,
    String? idNcpPartType,
    String? prefixNo,
  }) {
    return SubmitNcpState(
        selectedMonth: selectedMonth ?? this.selectedMonth,
        selectedVehicle: selectedVehicle ?? this.selectedVehicle,
        packingMonth: packingMonth ?? this.packingMonth,
        vehicleData: vehicleData ?? this.vehicleData,
        partNumber: partNumber ?? this.partNumber,
        isAbletoSearch: isAbletoSearch ?? this.isAbletoSearch,
        commissionForm: commissionForm ?? this.commissionForm,
        commissionTo: commissionTo ?? this.commissionTo,
        productionNoForm: productionNoForm ?? this.productionNoForm,
        productionNoTo: productionNoTo ?? this.productionNoTo,
        es1: es1 ?? this.es1,
        es2: es2 ?? this.es2,
        fzNo: fzNo ?? this.fzNo,
        intColor: intColor ?? this.intColor,
        paintColor: paintColor ?? this.paintColor,
        location: location ?? this.location,
        packageIdentification:
            packageIdentification ?? this.packageIdentification,
        idShortageProblem: idShortageProblem ?? this.idShortageProblem,
        quantity: quantity ?? this.quantity,
        lot: lot ?? this.lot,
        idNcpFeedbackLocation:
            idNcpFeedbackLocation ?? this.idNcpFeedbackLocation,
        idNcpPartType: idNcpPartType ?? this.idNcpPartType,
        prefixNo: prefixNo ?? this.prefixNo,
        parTypeData: parTypeData ?? this.parTypeData,
        shortAgeData: shortAgeData ?? this.shortAgeData,
        ncpFeedBackLocationData:
            ncpFeedBackLocationData ?? this.ncpFeedBackLocationData);
  }
}
