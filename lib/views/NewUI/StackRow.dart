// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

class StackRow extends StatefulWidget {
  final String bgImage;
  final String bgImage1;
  final String cIamge;
  final String c2Iamge;
  final String tText;
  final String countText;
  final String subText;
  final VoidCallback ontap;
  final String atext;
  final String xpText;
  final String RText;
  final String BText;
  final bool show;
  const StackRow(
      {Key? key,
      required this.bgImage,
      required this.bgImage1,
      required this.cIamge,
      required this.c2Iamge,
      required this.tText,
      required this.subText,
      required this.atext,
      required this.xpText,
      required this.countText,
      required this.RText,
      required this.BText,
      required this.ontap,
      required this.show})
      : super(key: key);

  @override
  State<StackRow> createState() => _StackRowState();
}

class _StackRowState extends State<StackRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 13),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(130)),
              child: Image(image: AssetImage(widget.bgImage))),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(130)),
              child: Image(image: AssetImage(widget.bgImage1))),
          Positioned(
            left: -8,
            child: GestureDetector(
              onTap: widget.ontap,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          height: 26.w,
                          width: 26.w,
                          child: Image(image: AssetImage(widget.cIamge))),
                      Positioned(
                          left: 2.5.w,
                          bottom: 3.3.w,
                          child: ClipOval(
                              child: SizedBox(
                                  height: 20.w,
                                  width: 20.w,
                                  child: NetworkImageWidget(
                                      image: widget.c2Iamge))))
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          textSize: 12.sp,
                          text: widget.tText,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff0E3f6B)
                          //ColorUtils.text1,
                          ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Row(
                          children: [
                            widget.show
                                ? TextWidget(
                                    text: widget.subText,
                                    textSize: 9.sp,
                                  )
                                : Row(
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: widget.atext,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8.sp))),
                                      RichText(
                                          text: TextSpan(
                                              text: widget.RText,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 8.sp))),
                                      RichText(
                                          text: TextSpan(
                                              text: widget.BText,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8.sp))),
                                    ],
                                  ),
                            const Expanded(child: SizedBox()),
                            TextWidget(
                              text: widget.countText,
                              textSize: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        children: [
                          widget.show
                              ? Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: widget.atext,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.RText,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.BText,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                  ],
                                )
                              : Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: widget.xpText,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.RText,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.BText,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                  ],
                                ),
                          const SizedBox(
                            width: 15,
                          ),
                          widget.show
                              ? Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: widget.xpText,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.RText,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 8.sp))),
                                    RichText(
                                        text: TextSpan(
                                            text: widget.BText,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8.sp))),
                                  ],
                                )
                              : Row(
                                  children: [
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    TextWidget(
                                      text: "PDF Booklets:",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      textSize: 8.sp,
                                    ),
                                    TextWidget(
                                        text: "7",
                                        textSize: 8.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)
                                  ],
                                )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
