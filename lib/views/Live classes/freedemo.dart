import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/Live%20classes/liveClasses.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';

import '../../Provider/Student Info/student_info_provider.dart';
import '../NewUI/NewPage.dart';
import '../pages/Widgets/Imagewidget.dart';
import '../pages/Widgets/TextWidget.dart';

class LiveClassesFreeDemo extends StatelessWidget {
  const LiveClassesFreeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    GlobalKey<AnimatorWidgetState> _animationkey =
        GlobalKey<AnimatorWidgetState>();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.w),
          child: const LiveClassesAppBar(),
        ),
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 1),
        drawer: const NewPage(),
        body: FutureBuilder(
          future: infoProvider.fetchApi(),
          builder: (context, snapshot) {
            return ListView(
              padding: EdgeInsets.all(5.w),
              children: [
                // const LiveClassesAppBar(),
                Container(
                  // margin: EdgeInsets.all(5.w),
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 30.h,
                ),
                SizedBox(
                  height: 2.w,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _animationkey.currentState!.forward();
                        Sound.play(Audio.waterDrop);
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LiveClasses()));
                          },
                        );
                      },
                      child: Swing(
                        key: _animationkey,
                        child: SvgPicture.asset(
                            "assets/PricingPalns/yellowbutton-optimized.svg"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        _animationkey.currentState!.forward();
                        await Sound.play(Audio.waterDrop);
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LiveClasses()));
                          },
                        );
                      },
                      child: TextWidget(
                        text: "BOOK A FREE DEMO",
                        fontWeight: FontWeight.bold,
                        textSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                ),
                Container(
                  //margin: EdgeInsets.all(5.w),
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 30.h,
                ),
              ],
            );
          },
        ));
  }
}

class LiveClassesAppBar extends StatelessWidget {
  const LiveClassesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 12.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.purple.shade400, Colors.purple])),
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
            TextWidget(
              text: 'Live Classes'.toUpperCase(),
              textSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
