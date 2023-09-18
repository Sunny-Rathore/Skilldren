// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

class DesActivity extends StatefulWidget {
  const DesActivity({Key? key}) : super(key: key);

  @override
  State<DesActivity> createState() => _DesActivityState();
}

class _DesActivityState extends State<DesActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(indicatorColor: Colors.white, tabs: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                        image: AssetImage("assets/activityDes/g600bulebg.png")),
                    Image(
                        image: AssetImage(
                            "assets/activityDes/text1064Destext.png")),
                  ],
                ),
                Image(
                    image: AssetImage(
                        "assets/activityDes/text878Actuivitytext.png")),
              ]),
              SizedBox(
                height: 500,
                child: TabBarView(children: [
                  Stack(
                    children: [
                      const Image(
                          image: AssetImage("assets/activityDes/g24debg.png")),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Image(
                            image: AssetImage("assets/activityDes/g66wbg.png")),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            TextWidget(
                              text:
                                  'Here, we will be learning about diﬀerent colors andchosing the right ones for your upcoming journey.Lets get started quickly!',
                              textSize: 13.33,
                              color: const Color(0xFF808285),
                            ),
                            const SizedBox(height: 20),
                            TextWidget(
                                text: 'Materials Required :',
                                textSize: 14.67.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            TextWidget(
                              text:
                                  'Drawing Sheet, Sketch Pens, Crayons, Oil Pastels,Scale, Pencil, Sharpner, Round Object',
                              textSize: 13.33,
                              color: const Color(0xFF808285),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      const Image(
                          image: AssetImage("assets/activityDes/g24debg.png")),
                      const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Image(
                            image: AssetImage("assets/activityDes/g66wbg.png")),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            TextWidget(
                              text:
                                  'Here, we will be learning about diﬀerent colors andchosing the right ones for your upcoming journey.Lets get started quickly!',
                              textSize: 13.33,
                              color: const Color(0xFF808285),
                            ),
                            const SizedBox(height: 20),
                            TextWidget(
                                text: 'Materials Required :',
                                textSize: 14.67,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            TextWidget(
                              text:
                                  'Drawing Sheet, Sketch Pens, Crayons, Oil Pastels,Scale, Pencil, Sharpner, Round Object',
                              textSize: 13.33,
                              color: const Color(0xFF808285),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
