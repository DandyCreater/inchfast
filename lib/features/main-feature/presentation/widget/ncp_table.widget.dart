import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inchfast/core/theme/style_text.dart';

import '../../../../core/theme/colors.dart';

class NcpTableWidget extends StatefulWidget {
  final String? partNumber;
  final String? partDescription;
  final String? es2;
  final String? fzNumber;
  final String? intPaintColor;
  final String? box;
  final String? comnos;
  final String? productionNumber;

  const NcpTableWidget(
      {required this.box,
      required this.comnos,
      required this.es2,
      required this.fzNumber,
      required this.intPaintColor,
      required this.partDescription,
      required this.partNumber,
      required this.productionNumber,
      super.key});

  @override
  State<NcpTableWidget> createState() => _NcpTableWidgetState();
}

class _NcpTableWidgetState extends State<NcpTableWidget> {
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
              style: UIStyle.extraBold(
                fontSize: 10.sp,
              ),
              textAlign: TextAlign.center,
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
                  flex: 2,
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
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Expanded(
                    child: _cardData(
                      title: "ES2",
                      value: widget.es2 ?? '-',
                    ),
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 1,
                  child: Expanded(
                    child: _cardData(
                      title: "FZ Number",
                      value: widget.fzNumber ?? '-',
                    ),
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 1,
                  child: Expanded(
                    child: _cardData(
                      title: "Int/Paint Color",
                      value: widget.intPaintColor ?? '-',
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
                  child: _cardData(
                    title: "Comnos",
                    value: widget.partNumber ?? '-',
                  )),
              SizedBox(
                width: 10.sp,
              ),
              Flexible(
                  flex: 4,
                  child: _cardData(
                    title: "Production Number",
                    value: widget.partDescription ?? '-',
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
