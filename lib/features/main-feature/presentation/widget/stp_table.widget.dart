import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class StpTableWidget extends StatelessWidget {
  const StpTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: UIColors.primaryColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    "Part Number",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Part Description",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Type",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "PM",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Model",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Dialog Address",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    Widget chipsData({required String title, required Color chipColor}) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: (chipColor == UIColors.greenLightColor)
                ? UIColors.greenDarkColor
                : UIColors.redDarkColor,
          ),
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          color: chipColor,
        ),
        child: Center(
          child: Text(
            title,
            style: UIStyle.medium(
              fontSize: 8.0,
              color: (chipColor == UIColors.greenLightColor)
                  ? UIColors.greenDarkColor
                  : UIColors.redDarkColor,
            ),
          ),
        ),
      );
    }

    Widget bodyList({required bool isOdd}) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: (isOdd == true) ? UIColors.oddColor : UIColors.whiteColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(
                    "A001",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Lorem Ipsum dolor",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Type A",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "PM #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Model A",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Address #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 500.w,
        child: Column(
          children: [
            title(),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: bodyList(isOdd: (index % 2 == 0) ? false : true),
                  );
                })
          ],
        ),
      ),
    );
  }
}
