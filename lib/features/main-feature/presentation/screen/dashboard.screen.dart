import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/config/routes/route.dart';
import 'package:inchfast/core/design_component/button.dart';
import 'package:inchfast/core/design_component/form.input.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';
import '../widget/dashboard_table.widget.dart';
import '../widget/menu_card.widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final scanCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/avatar.svg"),
            const SizedBox(
              width: 16.0,
            ),
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
                Text(
                  "Hello, Addyson Chavez!",
                  style: UIStyle.semiBold(fontSize: 12.0),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: UIColors.primaryColor,
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: UIColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
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
                      imgPath: "assets/images/unloading.png",
                      title: "Unloading",
                      onTap: () {
                        context.goNamed(AppRoutes.unloading);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: "assets/images/unpack.png",
                      title: "Unpack",
                      onTap: () {
                        context.goNamed(AppRoutes.unpack);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: "assets/images/moving.png",
                      title: "Moving",
                      onTap: () {
                        context.goNamed(AppRoutes.moving);
                      },
                    ),
                    MenuCardWidget(
                      imgPath: "assets/images/ncp.png",
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
                          title: 'Scan',
                          onTap: () {},
                          leftIcon: Image.asset("assets/icons/barcode.png"),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.sp,
          ),
          DashboardTableWidget(),
        ],
      ))),
    );
  }
}
