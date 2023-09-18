// ignore_for_file: file_names, prefer_typing_uninitialized_variables, unused_field

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Manage%20Videos/manage_videos_provider.dart';
import 'package:skilldren/Provider/Student%20Info/student_info_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/views/Live%20classes/freedemo.dart';
import 'package:skilldren/views/NewReals/reals.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/NewUI/category_page.dart';
import 'package:skilldren/views/Participate/participate.dart';

import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Prefrenses/prefrenses.dart';
import '../pages/Profile.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int currentLate = 0;

  var mydata;

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    final pref = Provider.of<Prefrenses>(context, listen: false);
    final GlobalKey<AnimatorWidgetState> _key1 =
        GlobalKey<AnimatorWidgetState>();
    final GlobalKey<AnimatorWidgetState> _key2 =
        GlobalKey<AnimatorWidgetState>();
    final GlobalKey<AnimatorWidgetState> _key3 =
        GlobalKey<AnimatorWidgetState>();
    final GlobalKey<AnimatorWidgetState> _key4 =
        GlobalKey<AnimatorWidgetState>();

    // final stakProvider = Provider.of<StackHomeProvider>(context, listen: false);
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size(double.infinity, 50.h),
        //   child: const DashBordAppBar(),
        // ),
        bottomNavigationBar: const NewBottomnavbar(
          selectedIndex: 2,
        ),
        drawer: const NewPage(),
        body: FutureBuilder(
          future: infoProvider.fetchApi().whenComplete(() {
            pref.getpref();
          }),

          // pref.getpref().whenComplete(() => {infoProvider.fetchApi()}),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.w,
                  ),
                  const DashBordAppBar(),
                  SizedBox(
                    height: 5.w,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.w),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60.w,
                            child: Image.asset(
                              "assets/images/bgimage1.jpg",
                              fit: BoxFit.fill,
                            )),
                      ),
                      _banner(),
                      Positioned(
                        top: 5.w,
                        left: 25.w,
                        child: Lottie.network(
                          'https://assets1.lottiefiles.com/packages/lf20_OiqxPlq97j.json',
                          width: 50.w,
                          height: 50.w,
                          fit: BoxFit.fill,
                          repeat: false,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 52.w,
                        child: Center(
                          child: Column(
                            children: [
                              TextWidget(
                                  text: "Welcome Back,",
                                  textSize: 18.71.sp,
                                  fontWeight: FontWeight.w400),
                              TextWidget(
                                text: infoProvider.mydata == null
                                    ? ""
                                    : infoProvider
                                        .mydata.response.studentInfo.firstName
                                        .toString()
                                        .capitalize(),

                                //name.toString().capitalize(),
                                textSize: 18.71.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      crossAxisSpacing: 1.w,
                      mainAxisSpacing: 1.w,
                      shrinkWrap: true,
                      childAspectRatio: 1.6,
                      crossAxisCount: 2,
                      children: List.generate(
                        4,
                        (index) => GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  _key1.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryPage()));
                                  });

                                  break;
                                case 1:
                                  _key2.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LiveClassesFreeDemo()));
                                  });
                                  break;
                                case 2:
                                  _key3.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Particiapte()));
                                  });
                                  break;
                                case 3:
                                  _key4.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RealPage()));
                                  });
                                  break;
                              }
                            },
                            child: index == 0
                                ? Jello(
                                    key: _key1,
                                    child: const ImageWidget(
                                        assetName:
                                            'assets/images/HomeStartLearning.png'),
                                  )
                                : index == 1
                                    ? Swing(
                                        key: _key2,
                                        child: const ImageWidget(
                                            assetName:
                                                'assets/images/homeLiveClasses.png'),
                                      )
                                    : index == 2
                                        ? Jello(
                                            key: _key3,
                                            child: const ImageWidget(
                                                assetName:
                                                    'assets/images/HomeParticipate.png'),
                                          )
                                        : Swing(
                                            key: _key4,
                                            child: const ImageWidget(
                                                assetName:
                                                    'assets/images/homeshowReals.png'),
                                            // Jello(
                                            //   key: index == 0
                                            //       ? _key1
                                            //       : index == 1
                                            //           ? _key2
                                            //           : index == 3
                                            //               ? _key3
                                            //               : _key4,
                                            //   child: ImageWidget(
                                            //       assetName: index == 0
                                            //           ? 'assets/images/HomeStartLearning.png'
                                            //           : index == 1
                                            //               ? 'assets/images/homeLiveClasses.png'
                                            //               : index == 2
                                            //                   ? 'assets/images/HomeParticipate.png'
                                            //                   : 'assets/images/homeshowReals.png'),
                                            // ),
                                          )),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 10.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: TextWidget(
                            text: "Recomended For You",
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  _banner1(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              ),
            );
          }),
        ));
  }

  Widget _banner() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, _) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 218.9,
              width: 364.06,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("assets/images/Property 1=Default.png")),
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            height: 50.w,
            aspectRatio: 2.5,
            autoPlay: true,
          ),
        ),
      ],
    );
  }

  Widget _banner1() {
    final videoprovider =
        Provider.of<ManageVideosProvider>(context, listen: false);
    return FutureBuilder(
      future: videoprovider.fechApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: TextWidget(text: snapshot.error.toString()),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: TextWidget(text: "No internet connection"),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CarouselSlider.builder(
              itemCount: videoprovider.mydata?.response?.length ?? 0,
              itemBuilder: (context, index, _) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              videoprovider.mydata.response[index].videoImage)),
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () async {
                      var uri = videoprovider.mydata.response[index].videoLink;
                      if (await canLaunchUrl(Uri.parse(uri))) {
                        await launchUrl(Uri.parse(uri));
                      } else {
                        throw 'Could not launch $uri';
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: Colors.black)),
                        child: TextWidget(
                          text: 'Play',
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                height: 150,
                aspectRatio: 2.5,
                autoPlay: true,
              ),
            ),
          ],
        );
      },
    );
  }
}

class DashBordAppBar extends StatefulWidget {
  const DashBordAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBordAppBar> createState() => _DashBordAppBarState();
}

class _DashBordAppBarState extends State<DashBordAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    return FutureBuilder(
      future: infoProvider.fetchApi(),
      builder: (context, snapshot) {
        return Container(
          alignment: Alignment.center,
          height: 25.w,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.white])),
          child: Padding(
            padding: EdgeInsets.only(left: 3.w, top: 10.w, right: 0.w),
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
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 25.w,
                      width: 25.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyProfilePage()));
                      },
                      child: ClipOval(
                        child: SizedBox(
                          height: 12.w,
                          width: 12.w,
                          child: Hero(
                            tag: "DP",
                            child: NetworkImageWidget(
                                image: infoProvider.mydata?.response
                                        ?.studentInfo?.profileImage ??
                                    'https://tse4.mm.bing.net/th?id=OIP.PlUghRkXvx9eqZvManVhsgHaIS&pid=Api&P=0'),
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      foregroundPainter:
                          CricleIndicator(_animationController.value * 70),
                      child: SizedBox(
                        height: 10.w,
                        width: 10.w,
                      ),
                    ),
                    Positioned(
                      bottom: -2.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              height: 6.w,
                              width: 6.w,
                              child: const ImageWidget(
                                  assetName: 'assets/images/levelPoint.png')),
                          TextWidget(
                            text: '2',
                            color: Colors.white,
                            textSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(
                  ImageUrl.newIcon,
                  height: 15.w,
                  width: 15.w,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CricleIndicator extends CustomPainter {
  final double progress;
  CricleIndicator(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 2.w
      ..color = Colors.yellow.shade100
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.width / 2);
    double radius = 7.5.w;
    canvas.drawCircle(center, radius, circle);
    Paint animationArc = Paint()
      ..strokeWidth = 2.w
      ..color = const Color(0xfffddb00)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double angle = 2 * pi * (progress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
