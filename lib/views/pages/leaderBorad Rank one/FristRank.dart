// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/Provider/RankList/ranklist_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/NewUI/NewHome.dart';

import 'package:skilldren/views/pages/Widgets/TextWidget.dart';
import 'package:skilldren/views/pages/leaderBorad%20Rank%20one/name_tile.dart';

import '../../../Provider/Student Rank/student_rank.dart';
import '../../NewUI/NewPage.dart';
import '../Widgets/Imagewidget.dart';

class FirstRank extends StatefulWidget {
  const FirstRank({Key? key}) : super(key: key);

  @override
  State<FirstRank> createState() => _FirstRankState();
}

class _FirstRankState extends State<FirstRank>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    Future.delayed(const Duration(seconds: 2), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final rank = Provider.of<StudentRankProvider>(context, listen: false);
    final lisrankProvider =
        Provider.of<RankListProvider>(context, listen: false);
    final prefrenses = Provider.of<Prefrenses>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.purple,
        drawer: const NewPage(),
        body: FutureBuilder(
            future: lisrankProvider.fechApi().then((value) {
              prefrenses.getpref();
            }),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: TextWidget(text: snapshot.error.toString()),
                );
              }
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    const Image(
                        image:
                            AssetImage('assets/images/rank1/Asset 16@2x.png')),
                    const Opacity(
                      opacity: 0.6,
                      child: Image(
                          image:
                              AssetImage('assets/images/rank1/coneimage.png')),
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Opacity(
                              opacity: 0.8,
                              child: Image(
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                  image: const AssetImage(
                                      'assets/images/rank1/Image 1.png')),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: SizedBox(
                                      height: 10.w,
                                      width: 10.w,
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/images/rank1/menuicon.png')),
                                    ),
                                  ),
                                  // TextWidget(
                                  //     text: 'LEADERBOARD',
                                  //     textSize: 25.sp,
                                  //     color: Colors.white,
                                  //     fontfamily: grandstander,
                                  //     fontWeight: FontWeight.bold),
                                  SizedBox(
                                    width: 50.w,
                                    height: 10.w,
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/images/rank1/text1438leaderboardtext.png')),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NewHomePage()));
                                    },
                                    child: Image(
                                        height: 13.w,
                                        width: 13.w,
                                        image: const AssetImage(
                                            'assets/images/rank1/path3676yellowicon.png')),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 10.w,
                              top: 20.w,
                              child: Lottie.network(
                                'https://assets1.lottiefiles.com/packages/lf20_OiqxPlq97j.json',
                                width: 300,
                                controller: _controller,
                                height: 300,
                                fit: BoxFit.fill,
                                repeat: false,
                                animate: _controller.status ==
                                    AnimationStatus.forward,
                              ),
                            ),
                            medalIMage(
                                13.w, 48.w, 'assets/images/For 1st@2x.png'),
                            medalIMage(
                                40.w, 37.w, 'assets/images/For 2nd@2x.png'),
                            medalIMage(
                                66.w, 50.w, 'assets/images/For 3rd@2x.png'),
                            userPic(
                              16.5.w,
                              53.7.w,
                              lisrankProvider
                                  .mydata.response[0].studentProfileImage,
                            ),
                            userPic(
                              43.5.w,
                              42.7.w,
                              lisrankProvider
                                  .mydata.response[1].studentProfileImage,
                            ),
                            userPic(
                              69.5.w,
                              55.7.w,
                              lisrankProvider
                                  .mydata.response[2].studentProfileImage,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    // lisrankProvider.mydata.response.length,
                                    itemBuilder: ((context, index) {
                                      return NameTile(
                                          high: lisrankProvider
                                                      .mydata
                                                      .response[index]
                                                      .studentName ==
                                                  name
                                              ? true
                                              : false,
                                          number: index + 1,
                                          title: lisrankProvider.mydata
                                              .response[index].studentName
                                              .toString()
                                              .capitalize(),
                                          xp: lisrankProvider
                                                  .mydata
                                                  .response[index]
                                                  .studentXpPoint
                                                  .toString() +
                                              "XP",
                                          person: index == 0
                                              ? "assets/images/rank1/cup.png"
                                              : index == 1
                                                  ? 'assets/images/rank1/cup2.png'
                                                  : 'assets/images/rank1/cup3.png');
                                    })),
                                SizedBox(
                                  height: 9.w,
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 7,
                                              //  lisrankProvider
                                              //         .mydata.response.length -
                                              //     3,
                                              itemBuilder: ((context, index) {
                                                return NameTile(
                                                    high:
                                                        lisrankProvider.mydata.response[index + 3].studentName ==
                                                                name
                                                            ? true
                                                            : false,
                                                    number: index + 4,
                                                    title: lisrankProvider
                                                        .mydata
                                                        .response[index + 3]
                                                        .studentName
                                                        .toString()
                                                        .capitalize(),
                                                    xp: lisrankProvider
                                                            .mydata
                                                            .response[index + 3]
                                                            .studentXpPoint
                                                            .toString() +
                                                        "XP",
                                                    person:
                                                        'assets/images/rank1/PersonImage.png',
                                                    textcolor:
                                                        lisrankProvider.mydata.response[index + 3].studentName ==
                                                                name
                                                            ? Colors.black
                                                            : Colors.white,
                                                    borderColor: lisrankProvider
                                                                .mydata
                                                                .response[index + 3]
                                                                .studentName ==
                                                            name
                                                        ? const Color(0xfffddb00)
                                                        : const Color(0xff58bde4));
                                              })),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                          rankbox(rank),
                                          showImage(rank),
                                          SizedBox(
                                            height: 5.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -1,
                                      left: 22.w,
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 12.w,
                                          width: 55.w,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff58bde4),
                                              borderRadius:
                                                  BorderRadius.circular(12.sp),
                                              border: Border.all(
                                                  width: 2,
                                                  color:
                                                      const Color(0xff1c75bc))),
                                          child: TextWidget(
                                            text: 'Consolation Winners',
                                            fontWeight: FontWeight.bold,
                                            textSize: 13.sp,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            })));
  }

  FutureBuilder<void> showImage(StudentRankProvider rank) {
    return FutureBuilder(
      future: rank.fechApi(),
      builder: (context, snapshot) {
        // print(rank
        //     .mydata.response.studentRank);

        if (int.parse(rank.mydata.response.studentRank) == 1) {
          return SizedBox(
            // height: 20.h,
            width: 60.w,
            child:
                const ImageWidget(assetName: 'assets/images/unbeliveable.png'),
          );
        } else if (int.parse(rank.mydata.response.studentRank) > 1 &&
            int.parse(rank.mydata.response.studentRank) < 4) {
          SizedBox(
            // height: 20.h,
            width: 60.w,
            child: const ImageWidget(assetName: 'assets/images/cool.png'),
          );
        } else if (int.parse(rank.mydata.response.studentRank) > 4 &&
            int.parse(rank.mydata.response.studentRank) < 10) {
          return SizedBox(
            // height: 20.h,
            width: 60.w,
            child: const ImageWidget(assetName: 'assets/images/awesome.png'),
          );
        }
        return SizedBox(
          // height: 20.h,
          width: 60.w,
          child: const ImageWidget(assetName: 'assets/images/whoops.png'),
        );
      },
    );
  }

  FutureBuilder<void> rankbox(StudentRankProvider rank) {
    return FutureBuilder(
      future: rank.fechApi(),
      builder: (context, snapshot) {
        if (int.parse(rank.mydata.response.studentRank) > 10) {
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 10.w,
                  child:
                      const ImageWidget(assetName: 'assets/myprofile/ProRed.png'
                          // "assets/myprofile/Leaderboard-removebg-preview.png"
                          ),
                ),
                Positioned(
                  top: 13.w,
                  left: 7.w,
                  child: TextWidget(
                    textSize: 14.sp,
                    text: "#",
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 14.w,
                  left: 12.w,
                  child: TextWidget(
                    textSize: 10.sp,
                    text: rank.mydata?.response?.studentRank ?? '',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  top: 14.5.w,
                  left: 32.w,
                  child: TextWidget(
                    textSize: 10.sp,
                    text: rank.mydata?.response?.studentName
                            .toString()
                            .capitalize() ??
                        '',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  top: 14.5.w,
                  left: 67.w,
                  child: TextWidget(
                    textSize: 10.sp,
                    text: rank.mydata?.response?.studentXpPoint.toString() ??
                        '' 'XP',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Positioned userPic(double left, top, String image) {
    return Positioned(
        left: left,
        top: top,
        child: ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              height: 13.w,
              width: 13.w,
              child: NetworkImageWidget(image: image),
            )));
  }

  Positioned medalIMage(double left, top, image) {
    return Positioned(
      left: left,
      // 250,
      top: top,
      // 210,
      child: Image(height: 28.w, width: 20.w, image: AssetImage(image)),
    );
  }
}
