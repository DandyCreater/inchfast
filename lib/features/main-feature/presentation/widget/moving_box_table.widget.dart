import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class MovingBoxTableWidget extends StatefulWidget {
  final String? shipName;
  final String? shipDeparture;
  final String? containerNo;
  final String? seal;
  final String? box;
  final String? model;
  final String? quantity;
  final String? fzCompleteNumber;
  final String? lastLocation;

  const MovingBoxTableWidget(
      {required this.fzCompleteNumber,
      required this.containerNo,
      required this.lastLocation,
      required this.model,
      required this.shipDeparture,
      required this.shipName,
      required this.quantity,
      required this.box,
      required this.seal,
      super.key});

  @override
  State<MovingBoxTableWidget> createState() => _MovingBoxTableWidgetState();
}

class _MovingBoxTableWidgetState extends State<MovingBoxTableWidget> {
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
                    flex: 1,
                    child: Expanded(
                      child: _cardData(
                        title: "Seal",
                        value: widget.seal ?? '-',
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 1,
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
                    flex: 1,
                    child: Expanded(
                      child: _cardData(
                        title: "Model",
                        value: widget.model ?? '-',
                      ),
                    )),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                    flex: 1,
                    child: Expanded(
                      child: _cardData(
                        title: "Quantity",
                        value: widget.quantity ?? '-',
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 11.sp,
            ),
            _cardData(
              title: "FzComplete Number",
              value: widget.fzCompleteNumber ?? '-',
            ),
            SizedBox(
              height: 11.sp,
            ),
            _cardData(
              title: "Last Location",
              value: widget.lastLocation ?? '-',
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
