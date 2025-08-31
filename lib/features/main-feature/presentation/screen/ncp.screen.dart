import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/constants/assets.constants.dart';
import 'package:inchfast/core/theme/style_text.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/config/routes/route.dart';
import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/dropdown.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../../domain/parameter/ncp_part_number.parameter.dart';
import '../../domain/parameter/submit_ncp.parameter.dart';
import '../bloc/get-ncp-number-bloc/get_ncp_number_bloc.dart';
import '../bloc/ncp-detail-bloc/ncp_detail_bloc.dart';
import '../bloc/search-ncp-number-bloc/search_ncp_number_bloc.dart';
import '../bloc/submit-ncp-data-bloc/submit_ncp_data_bloc.dart';
import '../cubit/submit-ncp-cubit/submit_ncp_cubit.dart' as cubit;
import '../widget/handling.widget.dart';
import '../widget/ncp_table.widget.dart';

class NcpScreen extends StatelessWidget {
  const NcpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<cubit.SubmitNcpCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GetNcpNumberBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchNcpNumberBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<NcpDetailBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SubmitNcpDataBloc>(),
        )
      ],
      child: const NcpContent(),
    );
  }
}

class NcpContent extends StatefulWidget {
  const NcpContent({super.key});

  @override
  State<NcpContent> createState() => _NcpContentState();
}

class _NcpContentState extends State<NcpContent> {
  final scanCtr = TextEditingController();
  final qtyCtr = TextEditingController();

  Widget cardData({
    required String? title,
    required String? value,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 8.sp),
      decoration: BoxDecoration(
          color: UIColors.whiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: UIColors.blackColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title ?? '',
            style: UIStyle.extraBold(fontSize: 10.sp),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Text(
            value ?? '',
            style: UIStyle.medium(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<cubit.SubmitNcpCubit>().setPackingMonth();
    context.read<cubit.SubmitNcpCubit>().loadNcpFeedBackLocationList();
    context.read<cubit.SubmitNcpCubit>().loadPartTypeDataList();
    context.read<cubit.SubmitNcpCubit>().loadShortAgeList();
    context.read<cubit.SubmitNcpCubit>().setLot("0001");
    context.read<cubit.SubmitNcpCubit>().setQty("0001");
    qtyCtr.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchNcpNumberBloc, SearchNcpNumberState>(
          listener: (context, state) {
            if (state is SearchNcpNumberSuccess) {
              context.read<NcpDetailBloc>().add(
                    FilterNcpNumber(
                      "0001",
                      state.value,
                    ),
                  );
            }
          },
        ),
        BlocListener<SubmitNcpDataBloc, SubmitNcpDataState>(
          listener: (context, state) {
            if (state is SubmitNcpDataLoading) {
              HandlingWidget.loadingDialog(context: context);
            }
            if (state is SubmitNcpDataSuccess) {
              context.pop();
              HandlingWidget.successDialog(
                  context: context,
                  onOk: () {
                    context.pushNamed(AppRoutes.ncp);
                  });
            }
            if (state is SubmitNcpDataFailed) {
              context.pop();
              HandlingWidget.failedDialog(
                  message: state.msg ?? '', context: context);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 100.sp,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.sp),
            child: GestureDetector(
              onTap: () {
                context.goNamed(AppRoutes.dashboard);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: UIColors.blackColor,
                  ),
                  Text(
                    "Back",
                    style: UIStyle.semiBold(
                      fontSize: 10.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          title: Text(
            "NCP",
            style: UIStyle.semiBold(
              fontSize: 14.sp,
            ),
          ),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<cubit.SubmitNcpCubit>().setPackingMonth();
              context
                  .read<cubit.SubmitNcpCubit>()
                  .loadNcpFeedBackLocationList();
              context.read<cubit.SubmitNcpCubit>().loadPartTypeDataList();
              context.read<cubit.SubmitNcpCubit>().loadShortAgeList();
              context.read<cubit.SubmitNcpCubit>().setLot("0001");
              context.read<cubit.SubmitNcpCubit>().setQty("0001");
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.sp,
                    ),
                    Text(
                      "Packing Month",
                      style: UIStyle.semiBold(
                        color: UIColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 4.sp),
                    BlocBuilder<cubit.SubmitNcpCubit, cubit.SubmitNcpState>(
                      builder: (context, state) {
                        return UIDropdown.basic(
                            item: state.packingMonth ??
                                [
                                  const DropdownValue(
                                    id: '',
                                    label: '',
                                  ),
                                ],
                            onChange: (value) {
                              context
                                  .read<cubit.SubmitNcpCubit>()
                                  .setVehicleModel(
                                    value ?? '',
                                  );
                            });
                      },
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Text(
                      "Model",
                      style: UIStyle.semiBold(
                        color: UIColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 4.sp),
                    BlocBuilder<cubit.SubmitNcpCubit, cubit.SubmitNcpState>(
                      builder: (context, state) {
                        return UIDropdown.basic(
                            value: (state.selectedVehicle != null &&
                                    state.vehicleData!.any(
                                        (v) => v.id == state.selectedVehicle))
                                ? state.selectedVehicle
                                : null,
                            item: state.vehicleData ??
                                [
                                  const DropdownValue(
                                    id: '',
                                    label: '',
                                  ),
                                ],
                            onChange: (value) {
                              context
                                  .read<cubit.SubmitNcpCubit>()
                                  .selectVehicle(
                                    value ?? '',
                                  );
                            });
                      },
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Text(
                      "Search Part Number",
                      style: UIStyle.semiBold(
                        color: UIColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 7,
                          child: UIInputForm.inputTextField(
                              onChanged: (value) {
                                context
                                    .read<cubit.SubmitNcpCubit>()
                                    .setPartNumber(
                                      scanCtr.text,
                                    );
                              },
                              controller: scanCtr,
                              placeHolder: "Type here.."),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        BlocBuilder<cubit.SubmitNcpCubit, cubit.SubmitNcpState>(
                          builder: (context, state) {
                            return Flexible(
                                flex: 3,
                                child: UIButton.primary(
                                  title: 'Search',
                                  onTap: (state.isAbletoSearch == true)
                                      ? () {
                                          final data = context
                                              .read<cubit.SubmitNcpCubit>()
                                              .state;
                                          context
                                              .read<SearchNcpNumberBloc>()
                                              .add(SearchNcpNumber(
                                                  params:
                                                      NcpPartNumberParameter(
                                                idVehicle: data.selectedVehicle,
                                                packingMonth:
                                                    data.selectedMonth,
                                                searchValue: scanCtr.text,
                                              )));
                                          context.read<GetNcpNumberBloc>().add(
                                                LoadNcpNumber(),
                                              );
                                        }
                                      : null,
                                  leftIcon: Image.asset(
                                    AssetsConstants.searchIcon,
                                  ),
                                  color: (state.isAbletoSearch == true)
                                      ? UIColors.primaryColor
                                      : UIColors.primaryColor.withOpacity(0.3),
                                ));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18.sp,
                    ),
                    UIButton.customPrimaryFull(
                        onTap: () async {
                          String? res = await SimpleBarcodeScanner.scanBarcode(
                            context,
                            barcodeAppBar: const BarcodeAppBar(
                              appBarTitle: 'Please Scan the Barcode',
                              centerTitle: true,
                              enableBackButton: true,
                              backButtonIcon: Icon(Icons.arrow_back_ios),
                            ),
                            isShowFlashIcon: true,
                            delayMillis: 2000,
                            cameraFace: CameraFace.front,
                          );
                          if (res != null) {
                            if (context.mounted) {
                              context
                                  .read<cubit.SubmitNcpCubit>()
                                  .setPartNumber(res);
                            }
                            scanCtr.text = res;
                          }
                        },
                        title: "Or Simply Scan the Barcode",
                        leftIcon: Image.asset(
                          AssetsConstants.barcodeIcon,
                        )),
                    SizedBox(
                      height: 16.sp,
                    ),
                    BlocBuilder<SearchNcpNumberBloc, SearchNcpNumberState>(
                      builder: (context, state) {
                        if (state is SearchNcpNumberLoading) {
                          return const Skeletonizer(
                            child: NcpTableWidget(
                                box: '-',
                                comnos: '-',
                                es2: '-',
                                fzNumber: '-',
                                intPaintColor: '-',
                                partDescription: '-',
                                partNumber: '-',
                                productionNumber: '-'),
                          );
                        }
                        if (state is SearchNcpNumberSuccess) {
                          return Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                          flex: 4,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 16.sp,
                                              ),
                                              BlocBuilder<GetNcpNumberBloc,
                                                  GetNcpNumberState>(
                                                builder: (context, state) {
                                                  if (state
                                                      is GetNcpNumberLoading) {
                                                    return Skeletonizer(
                                                      child: cardData(
                                                          title: 'NCP Number',
                                                          value: '-'),
                                                    );
                                                  }
                                                  if (state
                                                      is GetNcpNumberSuccess) {
                                                    context
                                                        .read<
                                                            cubit
                                                            .SubmitNcpCubit>()
                                                        .selectPrefixNo(
                                                          state.value?.data
                                                                  ?.prefixNo ??
                                                              '',
                                                        );
                                                    return cardData(
                                                      title: 'NCP Number',
                                                      value: state.value?.data
                                                              ?.ncpNumber ??
                                                          '',
                                                    );
                                                  }
                                                  return cardData(
                                                      title: 'NCP Number',
                                                      value: '-');
                                                },
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lot",
                                              style: UIStyle.medium(
                                                fontSize: 14.sp,
                                                color: UIColors.blackColor,
                                              ),
                                            ),
                                            SizedBox(height: 4.sp),
                                            UIDropdown.basic(
                                                item: lotList,
                                                onChange: (value) {
                                                  context
                                                      .read<
                                                          cubit
                                                          .SubmitNcpCubit>()
                                                      .setLot(value!);
                                                  context
                                                      .read<NcpDetailBloc>()
                                                      .add(FilterNcpNumber(
                                                        value,
                                                        state.value,
                                                      ));
                                                }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.sp,
                                  ),
                                  BlocBuilder<NcpDetailBloc, NcpDetailState>(
                                    builder: (context, state) {
                                      if (state is NcpDetailLoading) {
                                        return const Skeletonizer(
                                          child: NcpTableWidget(
                                              box: '-',
                                              comnos: '-',
                                              es2: '-',
                                              fzNumber: '-',
                                              intPaintColor: '-',
                                              partDescription: '-',
                                              partNumber: '-',
                                              productionNumber: '-'),
                                        );
                                      }
                                      if (state is NcpDetailSuccess) {
                                        var data = state.dataValue;
                                        if (state.dataValue == null) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 16.sp,
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    16.sp,
                                                  ),
                                                  child: Image.asset(
                                                    AssetsConstants.notFoundImg,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          context
                                              .read<cubit.SubmitNcpCubit>()
                                              .setSelectedElemet(
                                                idVehiclePart:
                                                    data?.idVehiclePart,
                                                commissionForm:
                                                    data?.commissionFrom,
                                                commissionTo:
                                                    data?.commissionTo,
                                                productionNoForm:
                                                    data?.productionNoFrom,
                                                productionNoTo:
                                                    data?.productionNoTo,
                                                es1: data?.es1,
                                                es2: data?.es2,
                                                fzNo: data?.fzNo,
                                                intColor: data?.interiorColour,
                                                paintColor:
                                                    data?.interiorColour,
                                                location:
                                                    data?.locationAreaName,
                                                packageIdentification:
                                                    data?.packageIdentification,
                                              );
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              NcpTableWidget(
                                                box:
                                                    data?.packageIdentification ??
                                                        '-',
                                                comnos:
                                                    "//${data?.commissionFrom} & ${data?.commissionTo}",
                                                es2: data?.es2 ?? '-',
                                                fzNumber: data?.fzNo ?? '-',
                                                intPaintColor:
                                                    data?.interiorColour ?? '-',
                                                partDescription:
                                                    data?.descriptionEnglish ??
                                                        '-',
                                                partNumber:
                                                    data?.partNumberReadformat ??
                                                        '-',
                                                productionNumber:
                                                    "${data?.productionNoFrom} & ${data?.productionNoTo}",
                                              ),
                                              SizedBox(
                                                height: 16.sp,
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Part Type",
                                                          style: UIStyle.medium(
                                                            fontSize: 14.sp,
                                                            color: UIColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4.sp),
                                                        BlocBuilder<
                                                            cubit
                                                            .SubmitNcpCubit,
                                                            cubit
                                                            .SubmitNcpState>(
                                                          builder:
                                                              (context, state) {
                                                            return UIDropdown
                                                                .basic(
                                                                    item: state
                                                                            .parTypeData ??
                                                                        [
                                                                          const DropdownValue(
                                                                            id: '',
                                                                            label:
                                                                                '',
                                                                          ),
                                                                        ],
                                                                    onChange:
                                                                        (value) {
                                                                      context
                                                                          .read<
                                                                              cubit
                                                                              .SubmitNcpCubit>()
                                                                          .selectPartType(
                                                                            value!,
                                                                          );
                                                                    });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Quantity",
                                                          style: UIStyle.medium(
                                                            fontSize: 14.sp,
                                                            color: UIColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4.sp),
                                                        // UIDropdown.basic(
                                                        //     item: lotList,
                                                        //     onChange: (value) {
                                                        //       context
                                                        //           .read<
                                                        //               cubit
                                                        //               .SubmitNcpCubit>()
                                                        //           .setQty(value!);
                                                        //     }),
                                                        UIInputForm
                                                            .inputTextField(
                                                                textInputType:
                                                                    TextInputType
                                                                        .phone,
                                                                controller:
                                                                    qtyCtr,
                                                                onChanged:
                                                                    (value) {
                                                                  context
                                                                      .read<
                                                                          cubit
                                                                          .SubmitNcpCubit>()
                                                                      .setQty(
                                                                          value);
                                                                })
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.sp,
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Location",
                                                          style: UIStyle.medium(
                                                            fontSize: 14.sp,
                                                            color: UIColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4.sp),
                                                        BlocBuilder<
                                                            cubit
                                                            .SubmitNcpCubit,
                                                            cubit
                                                            .SubmitNcpState>(
                                                          builder:
                                                              (context, state) {
                                                            return UIDropdown
                                                                .basic(
                                                                    item: state
                                                                            .ncpFeedBackLocationData ??
                                                                        [
                                                                          const DropdownValue(
                                                                            id: '',
                                                                            label:
                                                                                '',
                                                                          ),
                                                                        ],
                                                                    onChange:
                                                                        (value) {
                                                                      context
                                                                          .read<
                                                                              cubit
                                                                              .SubmitNcpCubit>()
                                                                          .selectFeedBackLocation(
                                                                            value!,
                                                                          );
                                                                    });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  Flexible(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Problem",
                                                          style: UIStyle.medium(
                                                            fontSize: 14.sp,
                                                            color: UIColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4.sp),
                                                        BlocBuilder<
                                                            cubit
                                                            .SubmitNcpCubit,
                                                            cubit
                                                            .SubmitNcpState>(
                                                          builder:
                                                              (context, state) {
                                                            return UIDropdown
                                                                .basic(
                                                                    item: state
                                                                            .shortAgeData ??
                                                                        [
                                                                          const DropdownValue(
                                                                            id: '',
                                                                            label:
                                                                                '',
                                                                          ),
                                                                        ],
                                                                    onChange:
                                                                        (value) {
                                                                      context
                                                                          .read<
                                                                              cubit
                                                                              .SubmitNcpCubit>()
                                                                          .selectShortAgeProblem(
                                                                            value!,
                                                                          );
                                                                    });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16.sp,
                                              ),
                                              Text(
                                                "Description",
                                                style: UIStyle.medium(
                                                  fontSize: 14.sp,
                                                  color: UIColors.blackColor,
                                                ),
                                              ),
                                              SizedBox(height: 4.sp),
                                              UIInputForm.textArea(
                                                  readOnly: true,
                                                  controller: TextEditingController(
                                                      text:
                                                          "Created by the Handheld System, please update the description in InchFast")),
                                              SizedBox(
                                                height: 24.sp,
                                              ),
                                              UIButton.primaryFull(
                                                title: "Submit",
                                                onTap: () {
                                                  final data = context
                                                      .read<
                                                          cubit
                                                          .SubmitNcpCubit>()
                                                      .state;
                                                  final params =
                                                      AddNcpParameter(
                                                    lot: data.lot,
                                                    idVehiclePart:
                                                        data.idVehiclePart ??
                                                            '',
                                                    idShortageProblem:
                                                        data.idShortageProblem ??
                                                            '',
                                                    packingMonth:
                                                        data.selectedMonth ??
                                                            '',
                                                    quantity: data.quantity,
                                                    idNcpFeedbackLocation:
                                                        data.idNcpFeedbackLocation ??
                                                            '',
                                                    idNcpPartType:
                                                        data.idNcpPartType ??
                                                            '',
                                                    commissionFrom:
                                                        data.commissionForm,
                                                    commissionTo:
                                                        data.commissionTo,
                                                    productionNoFrom:
                                                        data.productionNoForm,
                                                    productionNoTo:
                                                        data.productionNoTo,
                                                    es1: data.es1,
                                                    es2: data.es2,
                                                    fzNo: data.fzNo,
                                                    intColor: data.intColor,
                                                    paintColor: data.paintColor,
                                                    location: data.location,
                                                    packageIdentification: data
                                                        .packageIdentification,
                                                    prefixNo: data.prefixNo,
                                                  );
                                                  context
                                                      .read<SubmitNcpDataBloc>()
                                                      .add(SubmitNcpData(
                                                          params));
                                                },
                                              ),
                                              SizedBox(
                                                height: 24.sp,
                                              ),
                                            ],
                                          );
                                        }
                                      }
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: 16.sp,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                16.sp,
                                              ),
                                              child: Image.asset(
                                                AssetsConstants.notFoundImg,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 16.sp,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        if (state is SearchNcpNumberFailed) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(
                                16.sp,
                              ),
                              child: Image.asset(
                                AssetsConstants.notFoundImg,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(
                              16.sp,
                            ),
                            child: Image.asset(
                              AssetsConstants.noDataImg,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final lotList = [
  const DropdownValue(id: '0001', label: '1'),
  const DropdownValue(id: '0002', label: '2'),
  const DropdownValue(id: '0003', label: '3'),
  const DropdownValue(id: '0004', label: '4'),
  const DropdownValue(id: '0005', label: '5'),
  const DropdownValue(id: '0006', label: '6'),
  const DropdownValue(id: '0007', label: '7'),
  const DropdownValue(id: '0008', label: '8'),
  const DropdownValue(id: '0009', label: '9'),
  const DropdownValue(id: '0010', label: '10'),
  const DropdownValue(id: '0011', label: '11'),
  const DropdownValue(id: '0012', label: '12'),
  const DropdownValue(id: '0013', label: '13'),
  const DropdownValue(id: '0014', label: '14'),
  const DropdownValue(id: '0015', label: '15'),
  const DropdownValue(id: '0016', label: '16'),
  const DropdownValue(id: '0017', label: '17'),
  const DropdownValue(id: '0018', label: '18'),
  const DropdownValue(id: '0019', label: '19'),
  const DropdownValue(id: '0020', label: '20'),
  const DropdownValue(id: '0021', label: '21'),
  const DropdownValue(id: '0022', label: '22'),
  const DropdownValue(id: '0023', label: '23'),
  const DropdownValue(id: '0024', label: '24'),
  const DropdownValue(id: null, label: 'null'),
];
