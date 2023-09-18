// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../imageUrl/imageurl.dart';
import '../pages/Widgets/Imagewidget.dart';

class RedAppBar extends StatelessWidget {
  final String tittle;
  const RedAppBar({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 12.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffee426e),
        Color(0xffee426e),
      ])),
      child: Padding(
        padding: EdgeInsets.only(
            //horizontal: 5.w,
            left: 3.w,
            top: 8.w,
            right: 3.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SizedBox(
                height: 10.w,
                width: 10.w,
                child: const ImageWidget(
                    assetName: 'assets/images/rank1/menuicon.png'),
              ),
            ),
            Expanded(child: Container()),
            TextWidget(
                text: tittle.toUpperCase(),
                fontfamily: grandstander,
                textSize: 25.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            Expanded(child: Container()),
            SvgPicture.asset(
              ImageUrl.newIcon,
              width: 15.w,
              color: Colors.white,
            )
          ],
        ),
      ),
    );

    // Container(
    //   color: Colors.red,
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Builder(builder: (context) {
    //         return Builder(builder: (context) {
    //           return GestureDetector(
    //             onTap: () {
    //               Scaffold.of(context).openDrawer();
    //             },
    //             child: Container(
    //                 height: 40,
    //                 width: 40,
    //                 // margin: const EdgeInsets.all(5),
    //                 decoration:
    //                     BoxDecoration(borderRadius: BorderRadius.circular(13)),
    //                 child: Image.asset(
    //                   "assets/images/Asset 6@4x copy.png",
    //                 )),
    //           );
    //         });
    //       }),
    //       Expanded(child: Container()),
    // TextWidget(
    //     text: tittle.toUpperCase(),
    //     fontfamily: grandstander,
    //     textSize: 25,
    //     color: Colors.white,
    //     fontWeight: FontWeight.bold),
    // Expanded(child: Container()),
    // SvgPicture.asset(
    //   ImageUrl.newIcon,
    //   width: 15.w,
    //   color: Colors.white,
    // )
    //     ],
    //   ),
    // );
  }
}
