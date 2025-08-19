import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/constants/assets.constants.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../widget/ncp_table.widget.dart';

class NcpScreen extends StatefulWidget {
  const NcpScreen({super.key});

  @override
  State<NcpScreen> createState() => _NcpScreenState();
}

class _NcpScreenState extends State<NcpScreen> {
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
          "NCP",
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
                    "FZ No Complete",
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
                      onTap: () {},
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
            NcpTableWidget(),
          ],
        ),
      ),
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
