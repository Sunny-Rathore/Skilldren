// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/Student Rank/student_rank.dart';
import '../pages/Widgets/TextWidget.dart';

class Indicator extends StatelessWidget {
  final double? pw;
  const Indicator({
    Key? key,
    this.pw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rank = Provider.of<StudentRankProvider>(context, listen: false);
    return FutureBuilder(
      future: rank.fechApi(),
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Level",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      Text(
                        " 2- Noobie",
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color(0xFFef436e),
                            wordSpacing: 1),
                      ),
                    ],
                  ),
                  pw == null
                      ? Text(
                          rank.mydata == null
                              ? ""
                              : "${rank.mydata.response.studentXpPoint.toString()}/ ${rank.mydata.response.totalXpPoint.toString()} XP",
                          style: TextStyle(color: Colors.grey, fontSize: 8.sp),
                        )
                      : TextWidget(text: ""),
                ],
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 6.w),
                    alignment: Alignment.centerLeft,
                    height: 3.w,
                    width: pw ?? MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/images/AssetIndicagtorempty.png",
                            ))),
                  ),
                  Positioned(
                    // left: 6.w,
                    child: AnimatedContainer(
                      color: const Color(0xfffddb00),
                      duration: const Duration(seconds: 1),
                      width: rank.mydata == null
                          ? 2.w
                          : rank.mydata.response.studentXpPoint.toDouble() +
                              10.w,
                      height: 2.2.w,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.w,
              ),
              pw != null
                  ? Text(
                      rank.mydata == null
                          ? ""
                          : "${rank.mydata.response.studentXpPoint.toString()}/ ${rank.mydata.response.totalXpPoint.toString()} XP",
                      style: TextStyle(color: Colors.grey, fontSize: 8.sp),
                    )
                  : TextWidget(
                      text: "",
                      textSize: 0,
                    ),
            ],
          ),
        );
      },
    );
  }
}
