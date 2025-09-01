import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class HighRackTableWidget extends StatefulWidget {
  final String? shipName;
  final String? shipDeparture;
  final String? containerNo;
  final String? type;
  final String? box;
  final String? qty;
  final String? fzCompleteNumber;
  final String? partNumber;
  final String? partDescription;
  final String? lastBoxLocation;
  final String? rackLocation;
  final String? rackCode;
  final String? rackName;

  const HighRackTableWidget(
      {required this.fzCompleteNumber,
      required this.containerNo,
      required this.box,
      required this.lastBoxLocation,
      required this.partDescription,
      required this.partNumber,
      required this.qty,
      required this.rackCode,
      required this.rackLocation,
      required this.rackName,
      required this.shipDeparture,
      required this.shipName,
      required this.type,
      super.key});

  @override
  State<HighRackTableWidget> createState() => _HighRackTableWidgetState();
}

class _HighRackTableWidgetState extends State<HighRackTableWidget> {
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

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 3,
                  child: _cardData(
                    title: "Container No",
                    value: widget.containerNo ?? '-',
                  )),
              SizedBox(
                width: 10.sp,
              ),
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
                      title: "Type",
                      value: widget.type ?? '-',
                    ),
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 1,
                  child: Expanded(
                    child: _cardData(
                      title: "Qty",
                      value: widget.qty ?? '-',
                    ),
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 2,
                  child: Expanded(
                    child: _cardData(
                      title: "Fz Complete No",
                      value: widget.fzCompleteNumber ?? '-',
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
                  child: _cardData(
                    title: "Part Number",
                    value: widget.partNumber ?? '-',
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 4,
                  child: _cardData(
                    title: "Part Description",
                    value: widget.partDescription ?? '-',
                  )),
            ],
          ),
          SizedBox(
            height: 11.sp,
          ),
          _cardData(
            title: "Last Box Location",
            value: widget.lastBoxLocation ?? '-',
          ),
          SizedBox(
            height: 11.sp,
          ),
          _cardData(
            title: "Rack Location",
            value: widget.rackLocation ?? '-',
          ),
          SizedBox(
            height: 11.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 4,
                  child: _cardData(
                    title: "Rack Code",
                    value: widget.rackCode ?? '-',
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 4,
                  child: _cardData(
                    title: "Rack Name",
                    value: widget.rackName ?? '-',
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
