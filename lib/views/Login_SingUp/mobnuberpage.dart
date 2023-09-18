// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../imageUrl/imageurl.dart';
import '../pages/Widgets/TextWidget.dart';

class TextfieldWidgetBorder extends StatelessWidget {
  TextfieldWidgetBorder({
    Key? key,
    required this.mobcontroller,
    this.val,
    this.inputType,
  }) : super(key: key);
  final TextEditingController mobcontroller;
  String? val;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          ImageUrl.textField,
          height: 11.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6.5.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        10.sp,
                      ),
                      topRight: Radius.circular(12.sp),
                      bottomLeft: Radius.circular(3.sp),
                      bottomRight: Radius.circular(5.sp),
                    )),
                width: 13.w,
                height: 10.w,
                child: TextWidget(
                  text: '+91',
                  textSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 3.5.w,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.w),
                child: Container(
                  height: 8.w,
                  width: 0.2.w,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SizedBox(
                  height: 17.w,
                  width: 50.w,
                  child: TextFormField(
                    cursorHeight: 5.w,
                    keyboardType: inputType ?? TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length < 10 ||
                          value.length > 10) {
                        return 'Please Enter valid Mobile Number';
                      }
                      return null;
                    },
                    controller: mobcontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 0.5.w),
                        border: InputBorder.none),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
