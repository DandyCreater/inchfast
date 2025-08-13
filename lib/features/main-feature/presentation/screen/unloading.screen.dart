import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../widget/unloading_table.widget.dart';

class UnloadingScreen extends StatefulWidget {
  const UnloadingScreen({super.key});

  @override
  State<UnloadingScreen> createState() => _UnloadingScreenState();
}

class _UnloadingScreenState extends State<UnloadingScreen> {
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
          "Unloading",
          style: UIStyle.semiBold(
            fontSize: 14.sp,
          ),
        ),
      ),
      body: SafeArea(
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
            height: 24.sp,
          ),
          UnloadingTableWidget(),
        ],
      )),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16.sp,
            0.0,
            16.sp,
            24.sp,
          ),
          child: UIButton.primaryFull(
            title: "Submit",
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
