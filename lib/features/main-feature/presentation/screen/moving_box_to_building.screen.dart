import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/config/routes/route.dart';
import '../../../../core/constants/assets.constants.dart';
import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/dropdown.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style_text.dart';
import '../../domain/parameter/submit_moving_box.parameter.dart';
import '../bloc/location-area-bloc/location_area_bloc.dart';
import '../bloc/location-building-bloc/location_building_bloc.dart';
import '../bloc/location-section-bloc/location_section_bloc.dart';
import '../bloc/search-moving-box-bloc/search_moving_box_bloc.dart';
import '../bloc/submit-moving-box-bloc/submit_moving_box_bloc.dart';
import '../cubit/submit-moving-box-cubit/submit_moving_box_cubit.dart' as cubit;
import '../widget/handling.widget.dart';
import '../widget/moving_box_table.widget.dart';

class MovingBoxToBuildingScreen extends StatelessWidget {
  const MovingBoxToBuildingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SearchMovingBoxBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<LocationAreaBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<LocationBuildingBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<LocationSectionBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SubmitMovingBoxBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<cubit.SubmitMovingBoxCubit>(),
          lazy: true,
        ),
      ],
      child: const MovingBoxToDetailContent(),
    );
  }
}

class MovingBoxToDetailContent extends StatefulWidget {
  const MovingBoxToDetailContent({super.key});

  @override
  State<MovingBoxToDetailContent> createState() =>
      _MovingBoxToDetailContentState();
}

class _MovingBoxToDetailContentState extends State<MovingBoxToDetailContent> {
  final scanCtr = TextEditingController();
  final statusCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<cubit.SubmitMovingBoxCubit>().setLocationBuilding();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitMovingBoxBloc, SubmitMovingBoxState>(
      listener: (context, state) {
        if (state is SubmitMovingBoxLoading) {
          HandlingWidget.loadingDialog(context: context);
        }
        if (state is SubmitMovingBoxSuccess) {
          context.pop();
          HandlingWidget.successDialog(
              context: context,
              onOk: () {
                // context.read<cubit.SubmitMovingBoxCubit>().resetValue();
                // context.read<SearchMovingBoxBloc>().add(SearchMovingBox(
                //       params: scanCtr.text,
                //     ));
                // context
                //     .read<cubit.SubmitMovingBoxCubit>()
                //     .setLocationBuilding();
                context.goNamed(
                  AppRoutes.movingBoxToBuilding,
                );
              });
        }
        if (state is SubmitMovingBoxFailed) {
          context.pop();
          HandlingWidget.failedDialog(
              message: state.msg ?? '', context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 100.sp,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.sp),
            child: GestureDetector(
              onTap: () {
                context.pop();
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
            "Moving Box to Building",
            style: UIStyle.semiBold(
              fontSize: 14.sp,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Barcode Box",
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
                              controller: scanCtr, placeHolder: "Type here.."),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Flexible(
                            flex: 3,
                            child: UIButton.primary(
                              title: 'Search',
                              onTap: () {
                                context
                                    .read<SearchMovingBoxBloc>()
                                    .add(SearchMovingBox(
                                      params: scanCtr.text,
                                    ));
                              },
                              leftIcon: Image.asset(
                                AssetsConstants.searchIcon,
                              ),
                            ))
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
                                  .read<SearchMovingBoxBloc>()
                                  .add(SearchMovingBox(
                                    params: res,
                                  ));
                            }
                            scanCtr.text = res;
                          }
                        },
                        title: "Or Simply Scan the Barcode",
                        leftIcon: Image.asset(
                          AssetsConstants.barcodeIcon,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 24.sp,
              ),
              BlocBuilder<SearchMovingBoxBloc, SearchMovingBoxState>(
                builder: (context, state) {
                  if (state is SearchMovingBoxLoading) {
                    return const Skeletonizer(
                      child: MovingBoxTableWidget(
                        fzCompleteNumber: "testing",
                        containerNo: "testing",
                        lastLocation: "testing",
                        model: "testing",
                        shipDeparture: "testing",
                        shipName: "testing",
                        quantity: "testing",
                        box: "testing",
                        seal: "testing",
                      ),
                    );
                  }

                  if (state is SearchMovingBoxSuccess) {
                    final data = state.value?.data;
                    context.read<cubit.SubmitMovingBoxCubit>().setId(
                          data?.id ?? '',
                        );
                    return Column(
                      children: [
                        MovingBoxTableWidget(
                          fzCompleteNumber: data?.fzNumberComplete ?? '-',
                          containerNo: data?.containerNumber ?? '-',
                          lastLocation:
                              "${data?.locationBuilding ?? ''} - ${data?.locationArea ?? ''}",
                          model: data?.modelType ?? '-',
                          shipDeparture: data?.shipDeparture ?? '-',
                          shipName: data?.shipName ?? '-',
                          quantity: (data?.quantity ?? 0).toString(),
                          box: data?.box ?? '-',
                          seal: data?.sealNumber ?? '-',
                        ),
                        (data!.detailBox != null && data.detailBox!.isNotEmpty)
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.sp,
                                  vertical: 14.sp,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.goNamed(
                                      AppRoutes.movingBoxToBuildingDetail,
                                      extra: state.value!.data!.detailBox,
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Lihat Detail Box",
                                      style: UIStyle.medium(
                                          fontSize: 12.sp,
                                          color: UIColors.greenDarkColor),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.sp,
                              ),
                              Text(
                                "Location Building",
                                style: UIStyle.medium(
                                  fontSize: 14.sp,
                                  color: UIColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 4.sp),
                              BlocBuilder<cubit.SubmitMovingBoxCubit,
                                  cubit.SubmitMovingBoxState>(
                                builder: (context, state) {
                                  return UIDropdown.basic(
                                      item: state.locationBuildingData ??
                                          [
                                            const DropdownValue(
                                              id: '',
                                              label: '',
                                            ),
                                          ],
                                      onChange: (value) {
                                        context
                                            .read<cubit.SubmitMovingBoxCubit>()
                                            .setLocationArea(
                                              value ?? '',
                                            );
                                      });
                                },
                              ),
                              SizedBox(
                                height: 16.sp,
                              ),
                              Text(
                                "Location Area",
                                style: UIStyle.medium(
                                  fontSize: 14.sp,
                                  color: UIColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 4.sp),
                              BlocBuilder<cubit.SubmitMovingBoxCubit,
                                  cubit.SubmitMovingBoxState>(
                                builder: (context, state) {
                                  return UIDropdown.basic(
                                      item: state.locationAreaData ??
                                          [
                                            const DropdownValue(
                                              id: '',
                                              label: '',
                                            ),
                                          ],
                                      onChange: (value) {
                                        context
                                            .read<cubit.SubmitMovingBoxCubit>()
                                            .setLocationSection(
                                              value ?? '',
                                            );
                                      });
                                },
                              ),
                              SizedBox(
                                height: 16.sp,
                              ),
                              Text(
                                "Location Section",
                                style: UIStyle.medium(
                                  fontSize: 14.sp,
                                  color: UIColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 4.sp),
                              BlocBuilder<cubit.SubmitMovingBoxCubit,
                                  cubit.SubmitMovingBoxState>(
                                builder: (context, state) {
                                  return UIDropdown.basic(
                                      item: state.locationSectionData ??
                                          [
                                            const DropdownValue(
                                              id: '',
                                              label: '',
                                            ),
                                          ],
                                      onChange: (value) {
                                        context
                                            .read<cubit.SubmitMovingBoxCubit>()
                                            .setIdLocationSection(
                                              value ?? '',
                                            );
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is SearchMovingBoxFailed) {
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16.sp,
                  24.sp,
                  16.sp,
                  24.sp,
                ),
                child: BlocBuilder<cubit.SubmitMovingBoxCubit,
                    cubit.SubmitMovingBoxState>(
                  builder: (context, state) {
                    return UIButton.primaryFull(
                      color: (state.isAbletoSubmit == true)
                          ? UIColors.primaryColor
                          : UIColors.primaryColor.withOpacity(
                              0.2,
                            ),
                      title: "Submit",
                      onTap: (state.isAbletoSubmit == true)
                          ? () {
                              var data = context
                                  .read<cubit.SubmitMovingBoxCubit>()
                                  .state;
                              context
                                  .read<SubmitMovingBoxBloc>()
                                  .add(SubmitMovingBox(
                                    SubmitMovingBoxParams(
                                      id: data.id,
                                      idLocationSection: data.idLocationSection,
                                    ),
                                  ));
                            }
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
