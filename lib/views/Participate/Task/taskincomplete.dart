import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/Participate/participate.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

class Taskaincomplete extends StatelessWidget {
  const Taskaincomplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlueAppBar(size: size),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Indicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      const ImageWidget(
                          assetName: 'assets/TaskIncomplete/greyline.png'),
                      Positioned(
                        top: 2.w,
                        left: 6.w,
                        child: TextWidget(
                          text: 'WEEKLY TASK',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 12.sp,
                        ),
                      ),
                      Positioned(
                        left: 7.w,
                        top: 9.w,
                        child: TextWidget(
                          text: 'Introduce Yourself',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          textSize: 15.sp,
                        ),
                      ),
                      Positioned(
                        bottom: 2.w,
                        left: 5.w,
                        child: TextWidget(
                          text: 'TIME LEFT : 2D 16H 44M',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 10.sp,
                        ),
                      ),
                      Positioned(
                        top: 7.w,
                        right: 6.w,
                        child: TextWidget(
                          text: '+25xp',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text:
                        'Complete the Daily and Weekly Tasks to Earn XP & a chance to get featured on all the Skilldren Social Media Platforms.Its your chance to become a kid influencer!',
                    fontWeight: FontWeight.w400,
                    textSize: 13.sp,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      const ImageWidget(
                          assetName: 'assets/TaskIncomplete/greyBox.png'),
                      Positioned(
                          top: 16.w,
                          right: 13.w,
                          child: TextWidget(
                            text: 'INCOMPLETE',
                            fontWeight: FontWeight.bold,
                            textSize: 10.sp,
                          )),
                      Positioned(
                          top: 23.w,
                          right: 16.w,
                          child: TextWidget(
                            text: 'Lets GO!',
                            fontWeight: FontWeight.bold,
                            textSize: 12.sp,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const ImageWidget(
                          assetName: 'assets/TaskPending/yellowline.png'),
                      TextWidget(
                        text: 'RULES',
                        fontWeight: FontWeight.bold,
                        textSize: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text:
                        '1) You can draw any kind of duck using any color type and combination. Drawing the above picture is not compulsory.\n2) The artwork will be judged by overall sketch andcolor composition. The better you draw and fill, the more you score.',
                    color: Colors.grey,
                    //  fontWeight: FontWeight.bold,
                    textSize: 13.sp,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
