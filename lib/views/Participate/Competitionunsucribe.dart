// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

class CompetitionUnsuscribe extends StatefulWidget {
  final String title;
  final String desc;
  final String bannerimage;
  const CompetitionUnsuscribe(
      {Key? key,
      required this.title,
      required this.desc,
      required this.bannerimage})
      : super(key: key);

  @override
  State<CompetitionUnsuscribe> createState() => _CompetitionUnsuscribeState();
}

class _CompetitionUnsuscribeState extends State<CompetitionUnsuscribe> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextWidget(
              text: widget.title,
              textSize: 25.sp,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: 50.w,
              child: Image(
                  fit: BoxFit.fill, image: NetworkImage(widget.bannerimage)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: widget.desc,
              color: Colors.grey,
              textSize: 13.sp,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const ImageWidget(
                        assetName: 'assets/Unscribe/cheakbox.png'),
                    check == true
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                check = !check;
                              });
                            },
                            child: Icon(
                              Icons.done,
                              size: 15.w,
                              color: Colors.blue.shade300,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                check = !check;
                              });
                            },
                            child: SizedBox(
                              height: 8.w,
                              width: 10.w,
                            ))
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextWidget(
                    text: 'I have read all the rules and conditions*',
                    color: Colors.grey,
                    textSize: 13.sp,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          // width: 30.w,
                          height: 15.w,
                          child: const ImageWidget(
                              assetName: 'assets/Unscribe/yellowimage.png')),
                      Positioned(
                        top: 4.w,
                        child: TextWidget(
                          text: 'Pay ₹450/- to Enter',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
                TextWidget(
                  text: 'OR',
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          // width: 30.w,
                          height: 15.w,
                          child: const ImageWidget(
                              assetName: 'assets/Unscribe/yellowimage.png')),
                      Positioned(
                        top: 4.w,
                        child: TextWidget(
                          text: 'Get Free Access',
                          fontWeight: FontWeight.bold,
                          textSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextWidget(
                      text:
                          'Valid for only this competition.No premium features included.',
                      textSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: TextWidget(
                      text:
                          'Across all competitions, When you subscribe for the annual plan.',
                      textSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 40.w,
                width: 50.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const ImageWidget(
                        assetName: 'assets/Unscribe/enterbutton.png'),
                    Positioned(
                      child: TextWidget(
                        text: 'Enter',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textSize: 20.sp,
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
