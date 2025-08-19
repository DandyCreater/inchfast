import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class UnloadingTableWidget extends StatefulWidget {
  final String? shipName;
  final String? shipDeparture;
  final String? containerNo;
  final String? type;
  final String? description;
  final String? sealNo;
  final String? commnos;
  final String? box;
  final String? qty;
  final String? fzComplete;
  const UnloadingTableWidget(
      {required this.commnos,
      required this.containerNo,
      required this.description,
      required this.sealNo,
      required this.shipDeparture,
      required this.shipName,
      required this.type,
      required this.box,
      required this.qty,
      required this.fzComplete,
      super.key});

  @override
  State<UnloadingTableWidget> createState() => _UnloadingTableWidgetState();
}

class _UnloadingTableWidgetState extends State<UnloadingTableWidget> {
  @override
  Widget build(BuildContext context) {
    Widget _cardData({
      required String? title,
      required String? value,
    }) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 8.sp),
        decoration: BoxDecoration(
            color: UIColors.whiteColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: UIColors.blackColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: UIStyle.extraBold(fontSize: 10.sp),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Text(
              value ?? '',
              style: UIStyle.medium(fontSize: 10.sp),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: _cardData(
                      title: "Ship Name",
                      value: widget.shipName ?? '-',
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 3,
                    child: _cardData(
                      title: "Ship Departure",
                      value: widget.shipDeparture ?? '-',
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 3,
                    child: _cardData(
                      title: "Container No",
                      value: widget.containerNo ?? '-',
                    ))
              ],
            ),
            SizedBox(
              height: 11.sp,
            ),
            Row(
              children: [
                Flexible(
                    flex: 3,
                    child: Expanded(
                      child: _cardData(
                        title: "Type",
                        value: widget.type ?? '-',
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 7,
                    child: Expanded(
                      child: _cardData(
                        title: "Description",
                        value: widget.description ?? '-',
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 11.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 4,
                    child: Expanded(
                      child: _cardData(
                        title: "Seal No",
                        value: widget.sealNo ?? '-',
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 4,
                    child: Expanded(
                      child: _cardData(
                        title: "Commnos",
                        value: widget.commnos ?? '-',
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 11.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 3,
                    child: Expanded(
                      child: _cardData(
                        title: "Box",
                        value: widget.box ?? '-',
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 3,
                    child: Expanded(
                      child: _cardData(
                        title: "Qty",
                        value: widget.qty ?? "-",
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 3,
                    child: Expanded(
                      child: _cardData(
                        title: "FZ Complete#1",
                        value: widget.fzComplete ?? '-',
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 11.sp,
            ),
          ],
        ),
      ),
    );
  }
}

/*
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
                  flex: 2,
                  child: Text(
                    "Box",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Quantity",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Commnos",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Seal",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Part",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Fz Complete",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Location",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.whiteColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Loading",
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
        padding: const EdgeInsets.only(left: 16.0),
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
                  flex: 2,
                  child: Text(
                    "Box #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "10",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Commnos #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Seal",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Part #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Fz Complete #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Location #1",
                    style: UIStyle.medium(
                      fontSize: 7.sp,
                      color: UIColors.blackColor,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "11/08/22",
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
                    child: 
                    bodyList(isOdd: (index % 2 == 0) ? false : true),
                  );
                })
          ],
        ),
      ),
    ); */
