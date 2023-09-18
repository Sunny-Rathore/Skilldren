import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../NewUI/NewBottomNavBar.dart';
import '../../NewUI/NewPage.dart';
import '../../pricing Plans/pricingplans.dart';
import '../Widgets/Imagewidget.dart';

class MySubsCriptionPage extends StatelessWidget {
  const MySubsCriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
      drawer: const NewPage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.9,
                  child: SvgPicture.asset(
                    "assets/svg images/tutorialparts/my profile asset without notch.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  left: 5.w,
                  top: 5.h,
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: ImageWidget(
                            assetName: 'assets/images/rank1/menuicon.png'),
                      ),
                    );
                  }),
                ),
                Positioned(
                  left: 25.w,
                  bottom: 1.h,
                  child: TextWidget(
                    text: 'PRICING PLANS',
                    textSize: 25.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.w,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                    "assets/PricingPalns/yellowbutton-optimized.svg"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PricingPalns(
                              planId: "2",
                            )));
                  },
                  child: TextWidget(
                    text: "App +Live Classes",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            TextWidget(
              text: "OR",
              fontWeight: FontWeight.bold,
              textSize: 20,
              color: Colors.purple,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PricingPalns(
                              planId: "1",
                            )));
                  },
                  child: SvgPicture.asset(
                      "assets/PricingPalns/yellowbutton-optimized.svg"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PricingPalns(
                              planId: "1",
                            )));
                  },
                  child: TextWidget(
                    text: "App Only",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SvgPicture.asset(
              'assets/svg images/tutorialparts/Dashedline-optimized.svg',
              color: Colors.grey,
              width: MediaQuery.of(context).size.width - 10.w,
            ),
            SizedBox(
              height: 5.h,
            ),
            RedTitleBar(
              title: "My Subscription",
              left: 30.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 9.w),
              child: TextWidget(
                text:
                    "You do not seem to have any active subscription as of now.Subscribe now to active the premium benefits and enjoy the learning experience that comes along!",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                textSize: 10.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      text: "You hvae subscribed to:",
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextWidget(
                    text:
                        "App + Live Classes (6 Months) on 1 Jan, 2023 Valid till 1 Jun,2023",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
