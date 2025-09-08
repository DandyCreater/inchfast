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
  final String? lastLocation;
  final bool? esd;
  final String? additionalInformation;
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
      required this.lastLocation,
      required this.esd,
      required this.additionalInformation,
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
            _cardData(
              title: "Last Location",
              value: widget.lastLocation ?? '-',
            ),
            SizedBox(
              height: 11.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: _cardData(
                    title: 'ESD',
                    value: (widget.esd == true) ? "Yes" : "No",
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                  flex: 7,
                  child: _cardData(
                    title: 'Additional Information',
                    value: widget.additionalInformation,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
