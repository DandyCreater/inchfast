import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/form.input.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code Box",
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
                            onTap: () {},
                            leftIcon: Image.asset("assets/icons/search.png"),
                          ))
                    ],
                  ),
                ],
              ),
            ),
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
                        title: "Building",
                        onTap: () {},
                      ),
                      MenuCardWidget(
                        imgPath: "assets/images/station.png",
                        title: "Station",
                        onTap: () {},
                      ),
                      MenuCardWidget(
                        imgPath: "assets/images/trolley.png",
                        title: "Trolley",
                        onTap: () {},
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
