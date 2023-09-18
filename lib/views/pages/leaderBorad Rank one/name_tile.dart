 

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/Imagewidget.dart';
import '../Widgets/TextWidget.dart';

// ignore: must_be_immutable
class NameTile extends StatelessWidget {
  NameTile({
    Key? key,
    this.borderColor,
    this.textcolor,
    required this.person,
    this.high = false,
    required this.title,
    required this.xp,
    required this.number,
  }) : super(key: key);
  Color? textcolor;
  Color? borderColor;
  Color? highcolor;
  String person;
  bool high;

  final String title;
  final String xp;

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: high ? 20 : 10, horizontal: high ? 0 : 5.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: high ? 20.w : 10.w),
                alignment: Alignment.center,
                height: 10.w,
                width: MediaQuery.of(context).size.width - 34.w,
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor ?? Colors.white),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextWidget(
                  text: title,
                  fontWeight: high ? FontWeight.bold : FontWeight.normal,
                  color: Colors.black,
                  textSize: 14.sp,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 10.w,
                  width: 140,
                  decoration: BoxDecoration(
                      color: borderColor ?? Colors.yellow.shade700,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextWidget(
                    text: xp,
                    color: textcolor ?? Colors.black,
                    textSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        high
            ? Positioned(
                top: -1.9.w,
                left: 33.w,
                child: SizedBox(
                    height: 8.w,
                    width: 30.w,
                    child: const ImageWidget(
                        assetName:
                            'assets/images/rank1/My_Ranking-removebg-preview.png')),
              )
            : Container(),
        Positioned(
            left: high ? 5.w : 7.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "#",
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  textSize: 15.sp,
                ),
                TextWidget(
                    text: number.toString(),
                    color: high ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    textSize: 15.sp),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                    height: 10.w,
                    width: 10.w,
                    child:
                        //Image(image: NetworkImage(person))

                        ImageWidget(assetName: person
                            //?? 'assets/images/rank1/cup.png'
                            ))
              ],
            )),
      ],
    );
  }
}
