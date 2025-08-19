import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/colors.dart';
import 'package:inchfast/core/theme/style_text.dart';

class UIButton {
  static ElevatedButton primary({
    required String title,
    required VoidCallback onTap,
    Widget? leftIcon,
  }) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        )),
        backgroundColor: const WidgetStatePropertyAll(UIColors.primaryColor),
      ),
      onPressed: onTap,
      child: (leftIcon != null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leftIcon,
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  title,
                  style: UIStyle.extraBold(
                    color: UIColors.whiteColor,
                    fontSize: 8.0,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: UIStyle.extraBold(
                color: UIColors.whiteColor,
                fontSize: 10,
              ),
            ),
    );
  }

  static SizedBox primaryFull({
    required String title,
    required VoidCallback onTap,
    Widget? leftIcon,
    Color? color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 40.sp,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              color != null ? 0.0 : 50.0,
            ),
          )),
          backgroundColor: WidgetStatePropertyAll(
            (color != null) ? color : UIColors.primaryColor,
          ),
        ),
        onPressed: onTap,
        child: (leftIcon != null)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leftIcon,
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    title,
                    style: UIStyle.extraBold(
                      color: UIColors.whiteColor,
                      fontSize: 8.0,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: UIStyle.extraBold(
                  color: UIColors.whiteColor,
                  fontSize: 10,
                ),
              ),
      ),
    );
  }

  static Widget customPrimaryFull({
    required String title,
    required VoidCallback onTap,
    Widget? leftIcon,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40.sp,
        decoration: BoxDecoration(
          color: (color != null) ? color : UIColors.primaryColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: (leftIcon != null)
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                child: Row(
                  children: [
                    leftIcon,
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: UIStyle.semiBold(
                            color: UIColors.whiteColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: UIStyle.extraBold(
                    color: UIColors.whiteColor,
                    fontSize: 10,
                  ),
                ),
              ),
      ),
    );
  }
}
