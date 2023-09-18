// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Batch/batch_provider.dart';
import 'package:skilldren/Provider/LiveClassProvider/live_class_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/Live%20classes/freedemo.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Provider/Student Rank/student_rank.dart';
import '../NewUI/NewBottomNavBar.dart';
import '../pages/Widgets/TextWidget.dart';
import '../pricing Plans/pricingplans.dart';

class LiveClasses extends StatefulWidget {
  const LiveClasses({Key? key}) : super(key: key);

  @override
  State<LiveClasses> createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses>
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
    final batchProvider = Provider.of<BatchProvider>(context, listen: false);
    final rank = Provider.of<StudentRankProvider>(context, listen: false);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.w),
          child: const LiveClassesAppBar(),
        ),
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 1),
        drawer: const NewPage(),
        body: FutureBuilder(
          future: batchProvider.fechApi().then((value) {
            rank.fechApi();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                // const LiveClassesAppBar(),
                RedTitleBar(
                    left: 34.w,
                    title:
                        "My Batch : ${batchProvider.mydata?.response?[0].batchName ?? ''}"
                    //  ${rank.mydata.response.studentXpPoint > 5 ? batchProvider.mydata.response[0].batchName : batchProvider.mydata.response[1].batchName}"
                    ),
                SizedBox(
                  height: 2.5.h,
                ),
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
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        automaticIndicatorColorAdjustment: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            EdgeInsets.only(left: 5.w, right: 5.w, bottom: 1.w),
                        indicator: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          'assets/LoginImages/ContineuwUsing.png',
                        ))),
                        tabs: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.w,
                            ),
                            child: TextWidget(
                              text: "UPCOMING",
                              fontWeight: FontWeight.w900,
                              color: index == 0
                                  ? Colors.blue.shade900
                                  : Colors.grey.shade600,
                              textSize: 16,
                            ),
                          ),
                          TextWidget(
                            text: "PREVIOUS",
                            fontWeight: FontWeight.w900,
                            color: index == 1
                                ? Colors.blue.shade900
                                : Colors.grey.shade600,
                            textSize: 16,
                          ),
                        ]),
                    Container(
                      height: 10.w,
                      width: 0.25.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SvgPicture.asset(
                  'assets/svg images/tutorialparts/Dashedline-optimized.svg',
                  width: MediaQuery.of(context).size.width - 20.w,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  //batchName
                  child: TabBarView(controller: tabcontroller, children: [
                    upcomingView(context,
                        batchid:
                            batchProvider.mydata?.response?[0].batchId ?? 0),
                    previousView(context,
                        batchid:
                            batchProvider.mydata?.response?[0].batchId ?? 0),
                  ]),
                )
              ],
            );
          },
        ));
  }

  Widget previousView(BuildContext context, {itemCount, batchid}) {
    final liveClassprovider =
        Provider.of<LiveClassProvider>(context, listen: false);
    return FutureBuilder(
        future: liveClassprovider.fetchAip('Expire', batchid.toString()),
        builder: ((context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator()),
                )
              : liveClassprovider.mydata.errorMsg != null
                  ? Center(
                      child: TextWidget(
                          text: liveClassprovider.mydata.errorMsg.toString()),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              liveClassprovider.mydata?.response?.length ?? 0,
                          itemBuilder: ((context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    var uri = liveClassprovider
                                        .mydata.response[index].link;

                                    if (await canLaunchUrl(Uri.parse(uri))) {
                                      await launchUrl(Uri.parse(uri));
                                    } else {
                                      throw "Cant launch $uri";
                                    }
                                  },
                                  child: blueBox(
                                      context,
                                      'REVISIT',
                                      liveClassprovider
                                          .mydata.response[index].title
                                          .toString(),
                                      liveClassprovider
                                          .mydata.response[index].startClassDate
                                          .toString(),
                                      liveClassprovider
                                          .mydata.response[index].startClassTime
                                          .toString(),
                                      left: 6.w),
                                ),
                              ],
                            );
                          })),
                    );
        }));
  }

  Widget upcomingView(BuildContext context, {itemCount, batchid}) {
    final liveClassprovider =
        Provider.of<LiveClassProvider>(context, listen: false);
    return FutureBuilder(
        future: liveClassprovider.fetchAip('Upcoming', batchid.toString()),
        builder: ((context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator()),
                )
              : liveClassprovider.mydata.errorMsg != null
                  ? Center(
                      child: TextWidget(
                          text: liveClassprovider.mydata.errorMsg.toString()),
                    )
                  : ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          liveClassprovider.mydata?.response?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var uri = liveClassprovider
                                    .mydata.response[index].link;

                                if (await canLaunchUrl(Uri.parse(uri))) {
                                  await launchUrl(Uri.parse(uri));
                                } else {
                                  throw "Cant launch $uri";
                                }
                              },
                              child: blueBox(
                                context,
                                'JOIN',
                                liveClassprovider.mydata.response[index].title
                                    .toString(),
                                liveClassprovider
                                    .mydata.response[index].startClassDate
                                    .toString(),
                                liveClassprovider
                                    .mydata.response[index].startClassTime
                                    .toString(),
                              ),
                            ),
                          ],
                        );
                      }));
        }));
  }

  Stack blueBox(BuildContext context, String bigtext, title, day, time,
      {left}) {
    return Stack(
      children: [
        const ImageWidget(assetName: 'assets/TaskPending/BlueBox.png'),
        // SvgPicture.asset(
        //   'assets/svg images/tutorialparts/bulebox-optimized (1).svg',
        //   width: MediaQuery.of(context).size.width,
        // ),
        Positioned(
          right: left ?? 10.w,
          top: 14.w,
          child: TextWidget(
            text: bigtext,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            textSize: 17.sp,
          ),
        ),
        Positioned(
          left: 6.w,
          top: 14.5.w,
          child: TextWidget(
            text: title.toString().capitalize(),
            textSize: 15.sp,
            color: ColorUtils.text1,
          ),
        ),
        Positioned(
          left: 6.w,
          top: 1.5.w,
          child: TextWidget(
            text: day,
            textSize: 10.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Positioned(
          right: 6.w,
          top: 1.5.w,
          child: TextWidget(
            text: time,
            textSize: 10.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
