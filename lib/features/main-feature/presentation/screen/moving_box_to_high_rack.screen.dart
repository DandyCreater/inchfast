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
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style_text.dart';
import '../../domain/parameter/submit_high_rack.parameter.dart';
import '../bloc/search-high-rack-bloc/search_high_rack_bloc.dart';
import '../bloc/search-location-rack-bloc/search_location_rack_bloc.dart';
import '../bloc/submit-high-rack-bloc/submit_high_rack_bloc.dart';
import '../cubit/submit-high-rack-cubit/submit_high_rack_cubit.dart' as cubit;
import '../widget/handling.widget.dart';
import '../widget/high_rack_table.widget.dart';

class MovingBoxToHighRackScreen extends StatelessWidget {
  const MovingBoxToHighRackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SearchHighRackBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchLocationRackBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SubmitHighRackBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<cubit.SubmitHighRackCubit>(),
        )
      ],
      child: const MovingBoxToHighRackContent(),
    );
  }
}

class MovingBoxToHighRackContent extends StatefulWidget {
  const MovingBoxToHighRackContent({super.key});

  @override
  State<MovingBoxToHighRackContent> createState() =>
      _MovingBoxToHighRackContentState();
}

class _MovingBoxToHighRackContentState
    extends State<MovingBoxToHighRackContent> {
  final scanCtr = TextEditingController();
  final rackCtr = TextEditingController();

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
  Widget build(BuildContext context) {
    return BlocListener<SubmitHighRackBloc, SubmitHighRackState>(
      listener: (context, state) {
        if (state is SubmitHighRackLoading) {
          HandlingWidget.loadingDialog(context: context);
        }
        if (state is SubmitHighRackSuccess) {
          context.pop();
          HandlingWidget.successDialog(
              context: context,
              onOk: () {
                context.pushNamed(
                  AppRoutes.movingBoxToHighRack,
                );
              });
          rackCtr.clear();
        }
        if (state is SubmitHighRackFailed) {
          context.pop();
          HandlingWidget.failedDialog(
            message: state.msg ?? '',
            context: context,
          );
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
            "Moving STP in High Rack",
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fz Complete number",
                        style: UIStyle.semiBold(color: UIColors.primaryColor),
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
                              controller: scanCtr,
                              placeHolder: "Type here..",
                            ),
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
                                      .read<SearchHighRackBloc>()
                                      .add(SearchHighRack(
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
                            String? res =
                                await SimpleBarcodeScanner.scanBarcode(
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
                                    .read<SearchHighRackBloc>()
                                    .add(SearchHighRack(
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
                      SizedBox(
                        height: 24.sp,
                      ),
                      BlocBuilder<SearchHighRackBloc, SearchHighRackState>(
                        builder: (context, state) {
                          if (state is SearchHighRackLoading) {
                            return const Skeletonizer(
                                child: HighRackTableWidget(
                              fzCompleteNumber: "testing",
                              containerNo: "testing",
                              box: "testing",
                              lastBoxLocation: "testing",
                              partDescription: "testing",
                              partNumber: "testing",
                              qty: "testing",
                              rackCode: "testing",
                              rackLocation: "testing",
                              rackName: "testing",
                              shipDeparture: "testing",
                              shipName: "testing",
                              type: "testing",
                            ));
                          }
                          if (state is SearchHighRackSuccess) {
                            context.read<cubit.SubmitHighRackCubit>().setId(
                                  id: state.value?.data?.idLocationRack ?? '',
                                  rackCode: state.value?.data?.codeRack ?? '',
                                );
                            var data = state.value?.data;
                            return HighRackTableWidget(
                              fzCompleteNumber: data?.fzNumberComplete ?? '-',
                              containerNo: data?.containerNumber ?? '-',
                              box: data?.packageId ?? '-',
                              lastBoxLocation: data?.sectionName ?? '-',
                              partDescription: data?.desciptonEnglish ?? '-',
                              partNumber: data?.partNoReadFormat ?? '-',
                              qty: (data?.quantity ?? 0).toString(),
                              rackCode: data?.codeRack ?? '-',
                              rackLocation: data?.codeRack ?? '-',
                              rackName: data?.rackName ?? '-',
                              shipDeparture: data?.shipDeparture ?? '-',
                              shipName: data?.shipName ?? '-',
                              type: data?.modelType,
                            );
                          }
                          if (state is SearchHighRackFailed) {
                            return Center(
                              child: Image.asset(
                                AssetsConstants.notFoundImg,
                              ),
                            );
                          }
                          return Center(
                            child: Image.asset(
                              AssetsConstants.noDataImg,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 24.sp,
                      ),
                      BlocBuilder<SearchHighRackBloc, SearchHighRackState>(
                        builder: (context, state) {
                          if (state is SearchHighRackSuccess) {
                            if (state.value!.data!.idLocationRack == null ||
                                state.value!.data!.idLocationRack == '') {
                              return Text(
                                "This Fz Complete Number is not defined to High Rack, Please contact your administrator",
                                style: UIStyle.semiBold(
                                    color: UIColors.warningColor),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change Rack",
                                    style: UIStyle.semiBold(
                                        color: UIColors.primaryColor),
                                  ),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 7,
                                        child: UIInputForm.inputTextField(
                                            controller: rackCtr,
                                            placeHolder:
                                                "Type Rack Code Here.."),
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
                                                  .read<
                                                      SearchLocationRackBloc>()
                                                  .add(SearchLocationRack(
                                                    params: rackCtr.text,
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
                                        String? res = await SimpleBarcodeScanner
                                            .scanBarcode(
                                          context,
                                          barcodeAppBar: const BarcodeAppBar(
                                            appBarTitle:
                                                'Please Scan the Barcode',
                                            centerTitle: true,
                                            enableBackButton: true,
                                            backButtonIcon:
                                                Icon(Icons.arrow_back_ios),
                                          ),
                                          isShowFlashIcon: true,
                                          delayMillis: 2000,
                                          cameraFace: CameraFace.front,
                                        );
                                        if (res != null) {
                                          if (context.mounted) {
                                            context
                                                .read<SearchLocationRackBloc>()
                                                .add(SearchLocationRack(
                                                  params: res,
                                                ));
                                          }
                                          rackCtr.text = res;
                                        }
                                      },
                                      title: "Or Simply Scan the High Rack",
                                      leftIcon: Image.asset(
                                        AssetsConstants.barcodeIcon,
                                      )),
                                  SizedBox(
                                    height: 18.sp,
                                  ),
                                  BlocBuilder<SearchLocationRackBloc,
                                      SearchLocationRackState>(
                                    builder: (context, state) {
                                      if (state is SearchLocationRackLoading) {
                                        return Skeletonizer(
                                          child: cardData(
                                            title: 'Rack Code',
                                            value: 'rack code',
                                          ),
                                        );
                                      }
                                      if (state is SearchLocationRackSuccess) {
                                        context
                                            .read<cubit.SubmitHighRackCubit>()
                                            .setnewId(
                                                newId:
                                                    state.value?.data?.id ?? '',
                                                newRackCode:
                                                    state.value?.data?.code ??
                                                        '');
                                        return cardData(
                                          title: 'Rack Code',
                                          value: (state.value?.data?.code ?? 0)
                                              .toString(),
                                        );
                                      }
                                      return cardData(
                                        title: 'Rack Code',
                                        value: '-',
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  )
                                ],
                              );
                            }
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<SearchHighRackBloc, SearchHighRackState>(
          builder: (context, stateHR) {
            if (stateHR is SearchHighRackSuccess) {
              return BlocBuilder<cubit.SubmitHighRackCubit,
                  cubit.SubmitHighRackState>(
                builder: (context, state) {
                  if (stateHR.value!.data!.idLocationRack == null ||
                      stateHR.value!.data!.idLocationRack == null) {
                    return const SizedBox.shrink();
                  } else {
                    return SafeArea(
                        child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: UIButton.customPrimaryFull(
                        color: (state.isAbletoSubmit == true)
                            ? UIColors.primaryColor
                            : UIColors.primaryColor.withOpacity(
                                0.2,
                              ),
                        title: "Submit",
                        onTap: (state.isAbletoSubmit == true)
                            ? () {
                                var data = context
                                    .read<cubit.SubmitHighRackCubit>()
                                    .state;
                                context
                                    .read<SubmitHighRackBloc>()
                                    .add(SubmitHighRack(
                                      SubmitHighRackParameter(
                                        id: data.id,
                                        newId: data.newId,
                                      ),
                                    ));
                              }
                            : () {},
                      ),
                    ));
                  }
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
