import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/utils/string_utils.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import 'NewUI/NewPage.dart';

class TutorialOnePage extends StatefulWidget {
  const TutorialOnePage({Key? key}) : super(key: key);

  @override
  State<TutorialOnePage> createState() => _TutorialOnePageState();
}

class _TutorialOnePageState extends State<TutorialOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NewPage(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.5.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                            height: 10.w,
                            width: 10.w,
                            // margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13)),
                            child: Image.asset(
                              "assets/images/Asset 6@4x copy.png",
                            )),
                      );
                    }),
                    Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: const BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/images/Asset 5@4x.png",
                              )),
                        ))
                  ],
                ),
                SizedBox(
                  height: 7.w,
                ),
                const Indicator(),
                SizedBox(
                  height: 5.w,
                ),
                const Text(
                  "Tutorial 1",
                  style: TextStyle(
                      fontFamily: FontFamily.ballobhai2, fontSize: 21.33),
                ),
                Text(
                  "Introduction To Colors",
                  style: TextStyle(
                    fontFamily: FontFamily.ballobhai2,
                    fontSize: 24,
                    color: ColorUtils.text1,
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                        color: Color(0XFF6D6E71),
                        image: AssetImage(
                            'assets/tutorialonepageimage/path298blackbg (1).png')),
                    Image(
                        image: AssetImage(
                            'assets/tutorialonepageimage/g364w.png')),
                    Image(
                        image: AssetImage(
                            'assets/tutorialonepageimage/path370redplay.png')),
                  ],
                ),
                const Image(
                    image: AssetImage(
                        'assets/tutorialonepageimage/g612bgimagewithicon.png')),
                SizedBox(
                  height: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const T1Complete()));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                          image: AssetImage(
                              'assets/tutorialonepageimage/g380redwithBg.png')),
                      TextWidget(
                          text: "ACTIVITY",
                          textSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Stack(
                  children: [
                    const Image(
                        image: AssetImage(
                            'assets/tutorialonepageimage/g798under revierw.png')),
                    Positioned(
                        top: 2.w,
                        right: 3.w,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20)),
                            child: SizedBox(
                              height: 24.w,
                              width: 37.w,
                              child: const Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/g996.png')),
                            ))),
                    Positioned(
                      left: 12.w,
                      top: 3.5.w,
                      child: TextWidget(
                          text: "Under Review",
                          textSize: 9.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      left: 2.w,
                      top: 9.w,
                      child: SizedBox(
                          width: 45.w,
                          child: TextWidget(
                            textSize: 10.sp,
                            text:
                                "We just hope you’ve practiced\n well before submitting to the teacher! Check back later.",
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.w,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Image(
                        image: AssetImage(
                            "assets/tutorialonepageimage/g142border.png")),
                    const Positioned(
                      top: -10,
                      child: Image(
                          image: AssetImage(
                              "assets/tutorialonepageimage/g914greenBg.png")),
                    ),
                    Positioned(
                        top: -5,
                        left: 30,
                        child: TextWidget(
                            textSize: 10.sp,
                            text: "Teacher’s Remarks :",
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Positioned(
                      width: MediaQuery.of(context).size.width - 15.w,
                      top: 8.w,
                      left: 3.w,
                      child: TextWidget(
                        text:
                            "Your submission is currently being reviewed by the teacher. Result will be out soon!",
                        color: ColorUtils.text1,
                        textSize: 10.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
