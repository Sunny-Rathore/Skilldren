import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../NewUI/NewPage.dart';
import 'Competition/Competitionview.dart';
import 'Task/task.view.dart';

class Particiapte extends StatefulWidget {
  const Particiapte({Key? key}) : super(key: key);

  @override
  State<Particiapte> createState() => _ParticiapteState();
}

class _ParticiapteState extends State<Particiapte>
    with SingleTickerProviderStateMixin {
  int index = 0;

  late TabController tabcontroller;
  @override
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this);
    tabcontroller.addListener(() {
      setState(() {
        index = tabcontroller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.w),
        child: BlueAppBar(size: size),
      ),
      bottomNavigationBar: const NewBottomnavbar(selectedIndex: 3),
      drawer: const NewPage(),
      body: Column(
        children: [
          //BlueAppBar(size: size),
          const SizedBox(
            height: 20,
          ),
          const Indicator(),
          Stack(
            alignment: Alignment.center,
            children: [
              TabBar(
                  controller: tabcontroller,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  indicatorPadding:
                      EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.w),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  automaticIndicatorColorAdjustment: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/LoginImages/ContineuwUsing.png'))),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: TextWidget(
                        text: "TASKS",
                        fontWeight: FontWeight.w900,
                        color: index == 0
                            ? Colors.blue.shade900
                            : Colors.grey.shade600,
                        textSize: 16,
                      ),
                    ),
                    TextWidget(
                      text: "COMPETITIONS",
                      fontWeight: FontWeight.w900,
                      color: index == 1
                          ? Colors.blue.shade900
                          : Colors.grey.shade600,
                      textSize: 16,
                      //fontWeight: FontWeight.bold,
                    ),
                  ]),
              Container(
                height: 10.w,
                width: 0.25.w,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ImageWidget(assetName: "assets/Participate/dottedline.png"),
          Expanded(
            child: TabBarView(controller: tabcontroller, children: const [
              TaskView(),

              // CompetitionUnsuscribe()
              CompetitionView()
            ]),
          )
        ],
      ),
    );
  }
}

class BlueAppBar extends StatelessWidget {
  const BlueAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(10.0),
        height: 25.w,
        width: size.width,
        // color: Colors.purple.shade900,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple.shade400,
          Colors.deepPurple.shade800,
        ])),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(
            height: 40,
            width: 40,
            child: ImageWidget(assetName: 'assets/images/rank1/menuicon.png'),
          ),
          TextWidget(
            text: "PARTICIPATE",
            color: Colors.white,
            fontWeight: FontWeight.w900,
            textSize: 25.sp,
            fontfamily: grandstander,
          ),
          SizedBox(
              height: 10.w,
              width: 10.w,
              child: SvgPicture.asset(
                ImageUrl.newIcon,
                color: Colors.white,
              )),
        ]),
      ),
    );
  }
}
