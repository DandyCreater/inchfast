import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class MenuCardWidget extends StatelessWidget {
  final String? title;
  final String? imgPath;
  final VoidCallback onTap;
  const MenuCardWidget(
      {required this.imgPath,
      required this.title,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 156.w,
        height: 104.h,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: UIColors.shadowColor,
                blurRadius: 9,
                spreadRadius: 0,
                offset: Offset(1, 4),
              )
            ],
            borderRadius: BorderRadius.circular(0.75),
            color: UIColors.whiteColor),
        child: Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imgPath ?? ''),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  title ?? '',
                  style: UIStyle.semiBold(
                    color: UIColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
