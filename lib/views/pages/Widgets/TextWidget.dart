// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String? fontfamily;
  Color? color;
  double? textSize;
  FontWeight? fontWeight;
  TextWidget(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.textSize,
      this.fontfamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontfamily ?? balooBhai2,
          color: color ?? Colors.black,
          fontSize: textSize ?? 15.sp,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
