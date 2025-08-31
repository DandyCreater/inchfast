import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class DashboardTableWidget extends StatelessWidget {
  const DashboardTableWidget({super.key});

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
                    "Unloading",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    "Unpack",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Building",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Status",
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
        padding: EdgeInsets.only(left: 16.sp),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.count(
                    childAspectRatio: 2.7.sp,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      chipsData(
                        title: 'Undefined',
                        chipColor: UIColors.greenLightColor,
                      ),
                      chipsData(
                        title: 'Loading',
                        chipColor: UIColors.greenLightColor,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.count(
                    childAspectRatio: 2.7.sp,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      chipsData(
                        title: 'Unpacked',
                        chipColor: UIColors.redLightColor,
                      ),
                      chipsData(
                        title: 'Not Unpacked',
                        chipColor: UIColors.redLightColor,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "A001",
                      style: UIStyle.medium(
                        fontSize: 7.sp,
                        color: UIColors.blackColor,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "A002",
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
