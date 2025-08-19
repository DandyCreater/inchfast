import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../theme/colors.dart';

class UIInputForm {
  static TextFormField inputTextField({
    bool? obsecureText,
    required TextEditingController controller,
    String? placeHolder,
    Color? fillColor,
  }) {
    return TextFormField(
      obscureText: (obsecureText != null) ? obsecureText : false,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          hintText: placeHolder,
          hintStyle: UIStyle.semiBold(fontSize: 10.sp),
          contentPadding: EdgeInsets.fromLTRB(
            16.sp,
            (fillColor != null) ? 14.sp : 8.sp,
            0,
            (fillColor != null) ? 14.sp : 8.sp,
          ),
          fillColor: (fillColor != null) ? fillColor : UIColors.whiteColor,
          filled: (fillColor != null) ? true : false,
          enabledBorder: OutlineInputBorder(
            borderSide: (fillColor != null)
                ? BorderSide.none
                : const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: (fillColor != null)
                ? BorderSide.none
                : const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: (fillColor != null)
                ? BorderSide.none
                : const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
