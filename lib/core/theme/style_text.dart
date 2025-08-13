import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class UIStyle {
  static TextStyle semiBold({double? fontSize, Color? color}) {
    return GoogleFonts.urbanist(
        fontSize: (fontSize != null) ? fontSize : 11.sp,
        color: (color != null) ? color : UIColors.blackColor,
        fontWeight: FontWeight.w600);
  }

  static TextStyle regular({double? fontSize, Color? color}) {
    return GoogleFonts.urbanist(
        fontSize: (fontSize != null) ? fontSize : 11.sp,
        color: (color != null) ? color : UIColors.blackColor,
        fontWeight: FontWeight.w400);
  }

  static TextStyle extraBold({double? fontSize, Color? color}) {
    return GoogleFonts.urbanist(
        fontSize: (fontSize != null) ? fontSize : 11.sp,
        color: (color != null) ? color : UIColors.blackColor,
        fontWeight: FontWeight.w800);
  }

  static TextStyle medium({double? fontSize, Color? color}) {
    return GoogleFonts.urbanist(
        fontSize: (fontSize != null) ? fontSize : 1.sp,
        color: (color != null) ? color : UIColors.blackColor,
        fontWeight: FontWeight.w600);
  }
}
