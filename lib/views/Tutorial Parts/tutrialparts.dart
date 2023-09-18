import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/utils/color_utils.dart';

import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../NewUI/NewPage.dart';
import '../pages/Widgets/Imagewidget.dart';

class TutorialParts extends StatelessWidget {
  const TutorialParts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NewPage(),
      floatingActionButton: SvgPicture.asset(
        "assets/svg images/tutorialparts/share button.svg",
        height: 10.h,
        width: 10.w,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            //color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(13)),
                        child:
                            Image.asset("assets/images/Asset 6@4x copy.png")),
                  );
                }),
                const SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image(
                            image: AssetImage("assets/images/AsselOGO.png")),
                      ),
                      Expanded(
                        child: Image(
                            image:
                                AssetImage("assets/images/Asset sKILL100.jpg")),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const Indicator(),
          SizedBox(
            height: 3.h,
          ),
          TextWidget(
            text: "Tutorial 1",
            textSize: 20.sp,
          ),
          TextWidget(
            text: "Introduction To Colors",
            fontWeight: FontWeight.bold,
            color: ColorUtils.text1,
            textSize: 20.sp,
          ),
          SizedBox(
            height: 3.h,
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    const ImageWidget(
                        assetName: "assets/tutorialparts/Asset 6@2x.png"),
                    Positioned(
                      top: 2.h,
                      child: TextWidget(
                        text: "Part ${index + 1}",
                        color: ColorUtils.text1,
                        fontWeight: FontWeight.bold,
                        textSize: 20.sp,
                      ),
                    ),
                  ],
                );
              }))
        ]),
      ),
    );
  }
}
