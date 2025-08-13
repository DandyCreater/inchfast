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
  }) {
    return SizedBox(
      width: double.infinity,
      height: 40.sp,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
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
      ),
    );
  }
}
