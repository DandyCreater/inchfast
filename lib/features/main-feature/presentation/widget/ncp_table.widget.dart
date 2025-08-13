import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class NcpTableWidget extends StatelessWidget {
  const NcpTableWidget({super.key});

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
                  flex: 2,
                  child: Text(
                    "Box",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Quantity",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Commnos",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Seal",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Part",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Fz Complete",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Location",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Loading",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  ))
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
                  flex: 2,
                  child: Text(
                    "Box #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "10",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Commnos #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Seal",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Part #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Fz Complete #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Location #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "11/08/22",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  ))
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
