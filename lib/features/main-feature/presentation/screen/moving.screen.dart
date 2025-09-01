import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/config/routes/route.dart';
import '../../../../core/theme/colors.dart';
import '../widget/menu_card.widget.dart';

class MovingScreen extends StatefulWidget {
  const MovingScreen({super.key});

  @override
  State<MovingScreen> createState() => _MovingScreenState();
}

class _MovingScreenState extends State<MovingScreen> {
  final scanCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Moving",
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
                child: Column(children: [
                  SizedBox(
                    height: 24.sp,
                  ),
                  GridView.count(
                    childAspectRatio: 1.5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 24,
                    children: [
                      MenuCardWidget(
                        imgPath: "assets/images/building.png",
                        title: "Moving Box to Building",
                        onTap: () {
                          context.goNamed(
                            AppRoutes.movingBoxToBuilding,
                          );
                        },
                      ),
                      MenuCardWidget(
                        imgPath: "assets/images/trolley.png",
                        title: "Moving Box to High Rack",
                        onTap: () {
                          context.goNamed(
                            AppRoutes.movingBoxToHighRack,
                          );
                        },
                      ),
                    ],
                  ),
                ])),
          ],
        ),
      )),
    );
  }
}
