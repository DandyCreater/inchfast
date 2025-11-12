import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style_text.dart';
import '../../domain/entity/moving_box.entity.dart';

class MovingBoxToBuildingDetailScreen extends StatelessWidget {
  final List<DetailBoxEntity>? detailBox;
  const MovingBoxToBuildingDetailScreen({
    required this.detailBox,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleBox() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
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
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Qty",
                      style: UIStyle.medium(
                        fontSize: 7.sp,
                        color: UIColors.whiteColor,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "Lot",
                      style: UIStyle.medium(
                        fontSize: 7.sp,
                        color: UIColors.whiteColor,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Part/Package Desc",
                      style: UIStyle.medium(
                        fontSize: 7.sp,
                        color: UIColors.whiteColor,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Fz No Complete",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    Widget bodyBox({
      required final int index,
      final String? box,
      final String? qty,
      final String? lot,
      final String? partDesc,
      final String? fzNoComplete,
    }) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color:
                (index % 2 == 0) ? UIColors.whiteColor : UIColors.borderColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    box ?? '-',
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: (index % 2 == 0)
                          ? UIColors.blackColor
                          : UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    qty ?? '-',
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: (index % 2 == 0)
                          ? UIColors.blackColor
                          : UIColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    lot ?? '-',
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: (index % 2 == 0)
                          ? UIColors.blackColor
                          : UIColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      partDesc ?? '-',
                      style: UIStyle.medium(
                        fontSize: 7.sp,
                        color: (index % 2 == 0)
                            ? UIColors.blackColor
                            : UIColors.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    fzNoComplete ?? '-',
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: (index % 2 == 0)
                          ? UIColors.blackColor
                          : UIColors.whiteColor,
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 100.sp,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: UIColors.blackColor,
                ),
                Text(
                  "Back",
                  style: UIStyle.semiBold(
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
          ),
        ),
        title: Text(
          "Moving Box To Building",
          style: UIStyle.semiBold(
            fontSize: 14.sp,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 40.sp,
          ),
          titleBox(),
          Expanded(
            child: ListView.builder(
                itemCount: detailBox?.length ?? 0,
                itemBuilder: (context, index) {
                  var data = detailBox?[index];
                  return bodyBox(
                    index: index,
                    box: data?.packageId ?? '',
                    qty: (data?.quantity ?? 0).toString(),
                    lot: data?.lot ?? '-',
                    partDesc: data?.boxDescription ?? '-',
                    fzNoComplete: data?.fzNumberComplete ?? '-',
                  );
                }),
          )
        ],
      )),
    );
  }
}
