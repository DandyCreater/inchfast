import 'package:flutter/material.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../theme/colors.dart';

class UIInputForm {
  static TextFormField inputTextField({
    required TextEditingController controller,
    String? placeHolder,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          hintText: placeHolder,
          hintStyle: UIStyle.medium(),
          contentPadding: const EdgeInsets.fromLTRB(
            16.0,
            8.0,
            0.0,
            8.0,
          ),
          fillColor: UIColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: UIColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
