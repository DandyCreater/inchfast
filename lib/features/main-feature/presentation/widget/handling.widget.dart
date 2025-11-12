import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entity/close_unloading.entity.dart';

class HandlingWidget {
  static loadingDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static successDialog({
    required BuildContext context,
    String title = "Success",
    String message = "Data berhasil disimpan!",
    VoidCallback? onOk,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: UIColors.greenDarkColor,
            ),
            SizedBox(width: 8.sp),
            Text(
              "Success",
              style: UIStyle.semiBold(
                fontSize: 11.sp,
                color: UIColors.blackColor,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: UIStyle.medium(
            fontSize: 10.sp,
            color: UIColors.blackColor,
          ),
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
              UIColors.greenDarkColor,
            )),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (onOk != null) onOk();
            },
            child: Text(
              "OK",
              style: UIStyle.medium(
                color: UIColors.whiteColor,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static failedDialog({
    required BuildContext context,
    String title = "Failed",
    String message = "Data gagal disimpan!",
    VoidCallback? onOk,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.close,
              color: UIColors.warningColor,
            ),
            SizedBox(width: 8.sp),
            Text(
              "Failed",
              style: UIStyle.semiBold(
                fontSize: 11.sp,
                color: UIColors.blackColor,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: UIStyle.medium(
            fontSize: 10.sp,
            color: UIColors.blackColor,
          ),
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
              UIColors.warningColor,
            )),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (onOk != null) onOk();
            },
            child: Text(
              "Kembali",
              style: UIStyle.medium(
                color: UIColors.whiteColor,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static closeUnloadingDialog({
    required BuildContext context,
    required List<ListDataEntity> listData,
    VoidCallback? onOk,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.close,
              color: UIColors.warningColor,
            ),
            SizedBox(width: 8.sp),
            Text(
              "Box yang belum diunloading",
              style: UIStyle.semiBold(
                fontSize: 11.sp,
                color: UIColors.blackColor,
              ),
            ),
          ],
        ),
        content: SizedBox(
          height: 300.sp,
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${listData[index].box ?? '-'} / ${(listData[index].palleteFz != "") ? listData[index].palleteFz : listData[index].fzNoComplete}",
                    style: UIStyle.medium(
                      fontSize: 10.sp,
                      color: UIColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 4.sp,
                  )
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
              UIColors.warningColor,
            )),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (onOk != null) onOk();
            },
            child: Text(
              "Kembali",
              style: UIStyle.medium(
                color: UIColors.whiteColor,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
