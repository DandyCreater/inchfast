import 'package:bloc/bloc.dart';

import '../../../../../core/config/helper/date_format.dart';
import '../../../../../core/design_component/dropdown.dart';
import '../../../domain/usecase/get_ncp_feedback_location.usecase.dart';
import '../../../domain/usecase/get_ncp_part_data.usecase.dart';
import '../../../domain/usecase/get_ncp_shortage_problem.usecase.dart';
import '../../../domain/usecase/packing_month.usecase.dart';
import '../../../domain/usecase/vehicle_data.usecase.dart';

part 'submit_ncp_state.dart';

class SubmitNcpCubit extends Cubit<SubmitNcpState> {
  final PackingMonthUseCase _packingMonthUseCase;
  final VehicleDataUseCase _vehicleDataUseCase;
  final GetNcpPartDataUseCase _getNcpPartDataUseCase;
  final GetNcpFeedBackLocationUseCase _getNcpFeedBackLocationUseCase;
  final ShortAgeProblemUseCase _shortAgeProblemUseCase;
  SubmitNcpCubit(
    this._packingMonthUseCase,
    this._vehicleDataUseCase,
    this._getNcpPartDataUseCase,
    this._getNcpFeedBackLocationUseCase,
    this._shortAgeProblemUseCase,
  ) : super(const SubmitNcpState());

  void setPackingMonth() async {
    emit(state.copyWith(selectedVehicle: '', vehicleData: [
      const DropdownValue(
        id: '',
        label: '',
      ),
    ]));
    final result = await _packingMonthUseCase();
    result.fold((failure) {
      emit(state.copyWith(packingMonth: [
        const DropdownValue(
          id: '',
          label: '',
        )
      ], vehicleData: [
        const DropdownValue(
          id: '',
          label: '',
        )
      ]));
    }, (success) async {
      if (success != null && success.list!.isNotEmpty) {
        List<DropdownValue> successData = success.list!.map((x) {
          return DropdownValue(
            id: x,
            label: FormatDate.formatMonthYear(x),
          );
        }).toList();

        final resVehicle = await _vehicleDataUseCase(
          successData.first.id ?? '',
        );
        resVehicle.fold((failure) {
          state.copyWith(packingMonth: successData, vehicleData: [
            const DropdownValue(
              id: '',
              label: '',
            ),
          ]);
        }, (successVhc) {
          if (successVhc != null &&
              successVhc.list != null &&
              successVhc.list!.isNotEmpty) {
            List<DropdownValue> successVhcData = successVhc.list!.map((x) {
              return DropdownValue(
                id: x.id,
                label: x.name ?? '',
              );
            }).toList();
            emit(state.copyWith(
              selectedMonth: successData.first.id,
              selectedVehicle: successVhcData.first.id,
              packingMonth: successData,
              vehicleData: successVhcData,
            ));
            checkIsAbleToSearch();
          } else {
            emit(state.copyWith(packingMonth: successData, vehicleData: [
              const DropdownValue(
                id: '',
                label: '',
              )
            ]));
          }
        });
      }
    });
  }

  void setVehicleModel(String date) async {
    final resVehicle = await _vehicleDataUseCase(
      date,
    );
    resVehicle.fold((failure) {
      state.copyWith(vehicleData: [
        const DropdownValue(
          id: '',
          label: '',
        ),
      ]);
    }, (successVhc) {
      setSelectedMonth(date);
      if (successVhc != null &&
          successVhc.list != null &&
          successVhc.list!.isNotEmpty) {
        List<DropdownValue> successVhcData = successVhc.list!.map((x) {
          return DropdownValue(
            id: x.id,
            label: x.name ?? '',
          );
        }).toList();
        emit(state.copyWith(
          vehicleData: successVhcData,
        ));
      } else {
        emit(state.copyWith(vehicleData: [
          const DropdownValue(
            id: '',
            label: '',
          )
        ]));
      }
    });
  }

  void selectVehicle(String data) {
    emit(state.copyWith(
      selectedVehicle: data,
    ));
  }

  void setPartNumber(String text) {
    emit(state.copyWith(partNumber: text));
    checkIsAbleToSearch();
  }

  void setSelectedMonth(String text) {
    emit(state.copyWith(
      selectedMonth: text,
    ));
  }

  void checkIsAbleToSearch() {
    if (state.selectedMonth != null &&
        state.selectedMonth!.isNotEmpty &&
        state.selectedMonth != "" &&
        state.selectedVehicle != null &&
        state.selectedVehicle!.isNotEmpty &&
        state.selectedVehicle != "" &&
        state.partNumber != null &&
        state.partNumber!.isNotEmpty &&
        state.partNumber != "" &&
        state.partNumber!.length > 2) {
      emit(state.copyWith(
        isAbletoSearch: true,
      ));
    } else {
      emit(state.copyWith(isAbletoSearch: false));
    }
  }

  void setSelectedElemet({
    String? idVehiclePart,
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
  }) {
    emit(state.copyWith(
      idVehiclePart: idVehiclePart,
      commissionForm: commissionForm,
      commissionTo: commissionTo,
      productionNoForm: productionNoForm,
      productionNoTo: productionNoTo,
      es1: es1,
      es2: es2,
      fzNo: fzNo,
      intColor: intColor,
      paintColor: paintColor,
      location: location,
      packageIdentification: packageIdentification,
    ));
  }

  void setLot(String lot) {
    final formatLot = lot.replaceAll("0", "");
    int? lotInt = int.tryParse(formatLot);
    emit(state.copyWith(lot: lotInt));
  }

  void setQty(String qty) {
    final formatQty = qty.replaceAll("0", "");
    int? qtyInt = int.tryParse(formatQty);
    emit(state.copyWith(quantity: qtyInt));
  }

  void selectPartType(String value) {
    emit(state.copyWith(
      idNcpPartType: value,
    ));
  }

  void selectFeedBackLocation(String value) {
    emit(state.copyWith(
      idNcpFeedbackLocation: value,
    ));
  }

  void selectShortAgeProblem(String value) {
    emit(state.copyWith(idShortageProblem: value));
  }

  void selectPrefixNo(String value) {
    emit(state.copyWith(prefixNo: value));
  }

  void loadPartTypeDataList() async {
    final result = await _getNcpPartDataUseCase();
    result.fold((failure) {
      emit(state.copyWith(parTypeData: [
        const DropdownValue(id: '', label: ''),
      ]));
    }, (success) {
      emit(state.copyWith(
          idNcpPartType: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list?.first.id ?? ''
              : null,
          parTypeData: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list!.map((x) {
                  return DropdownValue(
                    id: x.id,
                    label: x.name ?? '',
                  );
                }).toList()
              : [const DropdownValue(id: '', label: '')]));
    });
  }

  void loadNcpFeedBackLocationList() async {
    final result = await _getNcpFeedBackLocationUseCase();
    result.fold((failure) {
      emit(state.copyWith(ncpFeedBackLocationData: [
        const DropdownValue(id: '', label: ''),
      ]));
    }, (success) {
      emit(state.copyWith(
          idNcpFeedbackLocation: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list?.first.id ?? ''
              : null,
          ncpFeedBackLocationData: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list!.map((x) {
                  return DropdownValue(
                    id: x.id,
                    label: x.name ?? '',
                  );
                }).toList()
              : [const DropdownValue(id: '', label: '')]));
    });
  }

  void loadShortAgeList() async {
    final result = await _shortAgeProblemUseCase();
    result.fold((failure) {
      emit(state.copyWith(shortAgeData: [
        const DropdownValue(id: '', label: ''),
      ]));
    }, (success) {
      emit(state.copyWith(
          idShortageProblem: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list?.first.id ?? ''
              : null,
          shortAgeData: (success != null &&
                  success.list != null &&
                  success.list!.isNotEmpty)
              ? success.list!.map((x) {
                  return DropdownValue(
                    id: x.id,
                    label: x.name ?? '',
                  );
                }).toList()
              : [const DropdownValue(id: '', label: '')]));
    });
  }
}
