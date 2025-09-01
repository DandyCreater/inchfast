import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/config/routes/route.dart';
import 'package:inchfast/core/design_component/button.dart';
import 'package:inchfast/core/design_component/form.input.dart';
import 'package:inchfast/core/theme/style_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/constants/assets.constants.dart';
import '../../../../core/theme/colors.dart';
import '../../../auth/presentation/bloc/user-bloc/user_bloc.dart';
import '../widget/dashboard_table.widget.dart';
import '../widget/menu_card.widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserBloc>(),
        )
      ],
      child: const DashboardContent(),
    );
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final scanCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(
          LoadUserData(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: UIStyle.medium(fontSize: 8.0),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return Skeletonizer(
                          child: Text(
                        "Hello, Addyson Chavez!",
                        style: UIStyle.semiBold(fontSize: 12.0),
                      ));
                    }
                    if (state is UserSuccess) {
                      return Text(
                        "Hello, ${state.value?.data?.user?.fullname ?? ''}",
                        style: UIStyle.semiBold(fontSize: 12.0),
                      );
                    }
                    return Skeletonizer(
                        child: Text(
                      "Hello, Addyson Chavez!",
                      style: UIStyle.semiBold(fontSize: 12.0),
                    ));
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.sp),
            child: SvgPicture.asset(
              AssetsConstants.avatarIcon,
            ),
          ),
        ],

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(
        //       right: 20.0,
        //     ),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: const CircleAvatar(
        //         backgroundColor: UIColors.primaryColor,
        //         child: Icon(
        //           Icons.notifications_none_outlined,
        //           color: UIColors.whiteColor,
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 24.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              children: [
                GridView.count(
                  childAspectRatio: 1.5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 24,
                  children: [
                    MenuCardWidget(
                      imgPath: AssetsConstants.unloadingImg,
                      title: "Unloading",
                      onTap: () {
                        context.goNamed(AppRoutes.unloading);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: AssetsConstants.unpackImg,
                      title: "Unpack",
                      onTap: () {
                        context.goNamed(AppRoutes.unpack);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: AssetsConstants.movingImg,
                      title: "Moving",
                      onTap: () {
                        context.goNamed(AppRoutes.moving);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: AssetsConstants.ncpImg,
                      title: "NCP",
                      onTap: () {
                        context.goNamed(AppRoutes.ncp);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 32.sp,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Flexible(
                //       flex: 7,
                //       child: UIInputForm.inputTextField(
                //           controller: scanCtr, placeHolder: "Type here.."),
                //     ),
                //     const SizedBox(
                //       width: 10.0,
                //     ),
                //     Flexible(
                //         flex: 3,
                //         child: UIButton.primary(
                //           title: 'Scan',
                //           onTap: () {},
                //           leftIcon: Image.asset(
                //             AssetsConstants.barcodeIcon,
                //           ),
                //         ))
                //   ],
                // ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 16.sp,
          // ),
          // DashboardTableWidget(),
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ChuckerFlutter.showChuckerScreen();
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
