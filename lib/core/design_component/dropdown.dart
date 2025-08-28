import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

class UIDropdown {
  static DropdownButtonFormField2 basic({
    String? placeHolder,
    required List<DropdownValue> item,
    required Function(String?)? onChange,
  }) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: (placeHolder == null)
          ? Text(
              item.first.label ?? '',
              style: UIStyle.medium(
                fontSize: 12.sp,
              ),
            )
          : null,
      items: item
          .map((item) => DropdownMenuItem<String>(
                value: item.id,
                child: Text(
                  item.label ?? '',
                  style: UIStyle.medium(
                    fontSize: 12.sp,
                  ),
                ),
              ))
          .toList(),
      onChanged: onChange,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

class DropdownValue {
  final String? id;
  final String? label;

  const DropdownValue({required this.id, required this.label});
}
