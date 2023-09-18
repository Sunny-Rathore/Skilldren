// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/utils/color_utils.dart';
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
  bool showPrice = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 5.w,
            ),
            TextWidget(
              text: widget.title,
              textSize: 25.sp,
              color: ColorUtils.text1,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50.w,
              child: Image(
                  fit: BoxFit.fill, image: NetworkImage(widget.bannerimage)),
            ),
            // TextWidget(
            //   text: widget.desc,
            //   color: Colors.grey,
            //   textSize: 13.sp,
            // ),
            // SizedBox(
            //   height: 5.w,
            // ),
            // Row(
            //   children: [
            //     Stack(
            //       alignment: Alignment.center,
            //       children: [
            //         SizedBox(
            //           height: 10.w,
            //           width: 10.w,
            //           child: const ImageWidget(
            //               assetName: 'assets/Unscribe/cheakbox.png'),
            //         ),
            //         check == true
            //             ? GestureDetector(
            //                 onTap: () {
            //                   setState(() {
            //                     check = !check;
            //                   });
            //                 },
            //                 child: Icon(
            //                   Icons.done,
            //                   size: 8.w,
            //                   color: Colors.blue.shade300,
            //                 ),
            //               )
            //             : GestureDetector(
            //                 onTap: () {
            //                   setState(() {
            //                     check = !check;
            //                   });
            //                 },
            //                 child: SizedBox(
            //                   height: 8.w,
            //                   width: 10.w,
            //                 ))
            //       ],
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Expanded(
            //       child: Row(
            //         children: [
            //           RichText(
            //             text: TextSpan(
            //               text:
            //                   'I have read all the rules and conditions, terms\n and conditions',
            //               style: DefaultTextStyle.of(context).style,
            //               children: const <TextSpan>[
            //                 TextSpan(
            //                     text: '*',
            //                     style: TextStyle(
            //                         color: Colors.red,
            //                         fontWeight: FontWeight.bold)),
            //               ],
            //             ),
            //           ),

            //           // TextWidget(
            //           //   text: '★',
            //           //   color: Colors.red,
            //           //   textSize: 2.sp,
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10.w,
            // ),
            // Visibility(
            //   visible: showPrice,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             SizedBox(
            //                 // width: 30.w,
            //                 height: 10.w,
            //                 child: const ImageWidget(
            //                     assetName:
            //                         'assets/LoginImages/ContineuwUsing.png'
            //                     //   'assets/Unscribe/yellowimage.png'
            //                     )),
            //             Positioned(
            //               // top: 4.w,
            //               child: TextWidget(
            //                 text: 'Pay ₹450/- to Enter',
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 textSize: 10.sp,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         width: 2.w,
            //       ),
            //       TextWidget(
            //         text: 'OR',
            //         color: Colors.red,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       SizedBox(
            //         width: 2.w,
            //       ),
            //       Expanded(
            //         child: Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             SizedBox(
            //                 // width: 30.w,
            //                 height: 10.w,
            //                 child: const ImageWidget(
            //                     assetName:
            //                         'assets/LoginImages/ContineuwUsing.png')),
            //             Positioned(
            //               // top: 4.w,
            //               child: GestureDetector(
            //                 onTap: () {
            //                   showDialog(
            //                       context: context,
            //                       builder: (context) {
            //                         return AlertDialog(
            //                           content: TextWidget(
            //                             text:
            //                                 'THANK YOU! You have successfully entered the Competition.',
            //                             textSize: 15.sp,
            //                           ),
            //                           actions: [
            //                             Padding(
            //                               padding: const EdgeInsets.all(8.0),
            //                               child: GestureDetector(
            //                                 onTap: () {
            //                                   setState(() {
            //                                     showPrice = false;
            //                                   });
            //                                   Navigator.of(context).pop(true);
            //                                 },
            //                                 child: Text(
            //                                   "Ok",
            //                                   style: TextStyle(fontSize: 20.sp),
            //                                 ),
            //                               ),
            //                             )
            //                           ],
            //                         );
            //                       });
            //                 },
            //                 child: TextWidget(
            //                   text: 'Get Free Access',
            //                   fontWeight: FontWeight.bold,
            //                   textSize: 10.sp,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Visibility(
            //   visible: true,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: SizedBox(
            //           child: TextWidget(
            //             text:
            //                 'Valid for only this competition.No premium features included.',
            //             textSize: 10.sp,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: SizedBox(
            //           child: TextWidget(
            //             text:
            //                 'Across all competitions, When you subscribe for the annual plan.',
            //             textSize: 10.sp,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10.w,
            ),
            Center(
              child: SizedBox(
                // height: 40.w,
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
