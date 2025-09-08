import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/constants/assets.constants.dart';
import 'package:inchfast/core/theme/style_text.dart';
import 'package:inchfast/features/main-feature/presentation/widget/handling.widget.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/config/routes/route.dart';
import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/dropdown.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/submit-unloading-bloc/submit_unloading_bloc.dart';
import '../bloc/unloading-bloc/unloading_bloc.dart';
import '../bloc/unloading-location-bloc/unloading_location_bloc.dart';
import '../bloc/unloading-status-bloc/unloading_status_bloc.dart';
import '../cubit/submit-unloading-cubit/submit_unloading_cubit.dart' as cubit;
import '../widget/unloading_table.widget.dart';

class UnloadingScreen extends StatelessWidget {
  const UnloadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UnloadingBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<UnloadingStatusBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<UnloadingLocationBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SubmitUnloadingBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<cubit.SubmitUnloadingCubit>(),
        ),
      ],
      child: const UnloadingContent(),
    );
  }
}

class UnloadingContent extends StatefulWidget {
  const UnloadingContent({super.key});

  @override
  State<UnloadingContent> createState() => _UnloadingContentState();
}

class _UnloadingContentState extends State<UnloadingContent> {
  final scanCtr = TextEditingController();
  final statusCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UnloadingStatusBloc>().add(
          GetStatusData(),
        );
    context.read<UnloadingLocationBloc>().add(
          GetUnloadingLocation(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitUnloadingBloc, SubmitUnloadingState>(
      listener: (context, state) {
        if (state is SubmitUnloadingLoading) {
          HandlingWidget.loadingDialog(context: context);
        }
        if (state is SubmitUnloadingSuccess) {
          context.pop();
          HandlingWidget.successDialog(
              context: context,
              onOk: () {
                context.pushNamed(
                  AppRoutes.unloading,
                );
              });
        }
        if (state is SubmitUnloadingFailed) {
          context.pop();
          HandlingWidget.failedDialog(context: context);
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
            "Unloading",
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
                              context: context,
                              controller: scanCtr,
                              placeHolder: "Type here.."),
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
                                    .read<UnloadingBloc>()
                                    .add(SearchUnloading(
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
                              context.read<UnloadingBloc>().add(SearchUnloading(
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
              BlocBuilder<UnloadingBloc, UnloadingState>(
                builder: (context, state) {
                  if (state is UnloadingLoading) {
                    return const Skeletonizer(
                      child: UnloadingTableWidget(
                        commnos: "testing",
                        containerNo: "testing",
                        description: "testing",
                        sealNo: "testing",
                        shipDeparture: "testing",
                        shipName: "testing",
                        type: "testing",
                        box: "testing",
                        qty: "testing",
                        fzComplete: "testing",
                        lastLocation: "testing",
                        esd: false,
                        additionalInformation: "testing",
                      ),
                    );
                  }

                  if (state is UnloadingSuccess) {
                    final data = state.value?.data;
                    List<String> additionalData = [];
                    context
                        .read<cubit.SubmitUnloadingCubit>()
                        .setIdFzNoComplete(
                          data?.id ?? '',
                        );
                    if (data?.additionalInformation != null &&
                        data!.additionalInformation!.isNotEmpty) {
                      for (var items in data.additionalInformation!) {
                        String? text =
                            "${items.typeDocument} - ${items.noDocument} ";
                        additionalData.add(text);
                      }
                    }
                    return Column(
                      children: [
                        UnloadingTableWidget(
                          additionalInformation: additionalData.join(', '),
                          esd: data?.esd ?? false,
                          commnos: data?.commnos ?? '-',
                          containerNo: data?.containerNumber ?? '-',
                          description: data?.description ?? '-',
                          sealNo: data?.sealNo ?? '-',
                          shipDeparture: data?.shipDeparture ?? '-',
                          shipName: data?.shipName ?? '-',
                          type: data?.type ?? '-',
                          box: data?.box ?? '-',
                          qty: (data?.quantity ?? 0).toString(),
                          fzComplete: data?.fzNoComplete ?? '-',
                          lastLocation: (data?.loading != null)
                              ? data?.loading?.locationName
                              : '-',
                        ),
                        (state.value!.data!.detailBox != null &&
                                state.value!.data!.detailBox!.isNotEmpty)
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.sp,
                                  vertical: 14.sp,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.goNamed(
                                      AppRoutes.unloadingDetail,
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
                        (state.value!.data!.loading == null)
                            ? BlocBuilder<UnloadingLocationBloc,
                                UnloadingLocationState>(
                                builder: (context, state) {
                                  if (state is UnloadingLocationLoading) {
                                    return Skeletonizer(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                          Text(
                                            "Status",
                                            style: UIStyle.medium(),
                                          ),
                                          SizedBox(height: 4.sp),
                                          UIDropdown.basic(
                                              item: [], onChange: (value) {}),
                                        ],
                                      ),
                                    ));
                                  }
                                  if (state is UnloadingLocationSuccess) {
                                    context
                                        .read<cubit.SubmitUnloadingCubit>()
                                        .setIdLocation(
                                          state.listValue.first.id ?? '',
                                        );
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16.sp,
                                          ),
                                          Text(
                                            "Location",
                                            style: UIStyle.medium(
                                              fontSize: 14.sp,
                                              color: UIColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 4.sp),
                                          UIDropdown.basic(
                                              item: state.listValue,
                                              onChange: (value) {
                                                context
                                                    .read<
                                                        cubit
                                                        .SubmitUnloadingCubit>()
                                                    .setIdLocation(
                                                      value ?? '',
                                                    );
                                              }),
                                        ],
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              )
                            : const SizedBox.shrink(),
                        (state.value!.data!.loading == null)
                            ? BlocBuilder<UnloadingStatusBloc,
                                UnloadingStatusState>(
                                builder: (context, state) {
                                  if (state is UnloadingStatusLoading) {
                                    return Skeletonizer(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16.sp,
                                          ),
                                          Text(
                                            "Status",
                                            style: UIStyle.medium(),
                                          ),
                                          SizedBox(height: 4.sp),
                                          UIDropdown.basic(
                                              item: [], onChange: (value) {}),
                                        ],
                                      ),
                                    ));
                                  }
                                  if (state is UnloadingStatusSuccess) {
                                    context
                                        .read<cubit.SubmitUnloadingCubit>()
                                        .setStatus(
                                          int.tryParse(
                                                  state.listValue.first.id ??
                                                      "0") ??
                                              0,
                                        );
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 16.sp,
                                          ),
                                          Text(
                                            "Status",
                                            style: UIStyle.medium(
                                              fontSize: 14.sp,
                                              color: UIColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 4.sp),
                                          UIDropdown.basic(
                                              item: state.listValue,
                                              onChange: (value) {
                                                context
                                                    .read<
                                                        cubit
                                                        .SubmitUnloadingCubit>()
                                                    .setStatus(int.tryParse(
                                                            value ?? '') ??
                                                        0);
                                              }),
                                        ],
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  }
                  if (state is UnloadingFailed) {
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
              BlocBuilder<UnloadingBloc, UnloadingState>(
                builder: (context, state) {
                  if (state is UnloadingSuccess) {
                    if (state.value!.data!.loading == null) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          16.sp,
                          24.sp,
                          16.sp,
                          24.sp,
                        ),
                        child: UIButton.primaryFull(
                          title: "Submit",
                          onTap: () {
                            var data = context
                                .read<cubit.SubmitUnloadingCubit>()
                                .state;
                            context
                                .read<SubmitUnloadingBloc>()
                                .add(StartSubmitUnloading(
                                  id: data.id,
                                  idLocation: data.idLocation,
                                  status: data.status,
                                ));
                          },
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
