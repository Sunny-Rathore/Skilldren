// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/Provider/Student%20Info/student_info_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/NewUI/chapter_page.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';
import 'package:skilldren/widgets/cliper.dart';

import '../../Notification_Service/notification_service.dart';
import '../../Provider/getAllcategory/getall_category_provider.dart';
import '../../imageUrl/imageurl.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _LeanPageState();
}

class _LeanPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<GetAllCategoryProvier>(context, listen: false);
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    final prefrenses = Provider.of<Prefrenses>(context, listen: false);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.w),
          child: Builder(builder: (context) {
            return Container(
              alignment: Alignment.center,
              height: 12.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.white])),
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
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageUrl.newIcon,
                          height: 10.w,
                          width: 10.w,
                        ),
                        SizedBox(
                            width: 35.w,
                            child: const ImageWidget(
                                assetName: ImageUrl.SkilldrenText)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        bottomNavigationBar: const NewBottomnavbar(
          selectedIndex: 0,
        ),
        drawer: const NewPage(),
        body: FutureBuilder(
            future: categoryProvider.fetchAPI().then((value) {
              infoProvider.fetchApi().then((value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                int? notifie;
                // prefs.setInt(notifekey, 4);

                notifie = prefs.getInt(notifekey);
                debugPrint('Before: $notifie');
                if (categoryProvider.mydata.response.length == notifie &&
                    prefrenses.actitvi_status == true) {
                  scheduleNotification().then((value) {
                    prefs.setInt(
                        notifekey, categoryProvider.mydata.response.length);

                    debugPrint('After: $notifie');
                  });
                }
              });
            }),
            builder: ((context, snapshot) {
              return SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 50.w,
                          width: MediaQuery.of(context).size.width,
                          child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/greybg.jpg")),
                        ),
                        const Image(
                            image: AssetImage("assets/images/skyBg.png")),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileBox(
                            name: name.toString().capitalize(),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  categoryProvider.mydata?.response?.length ??
                                      0,
                              // shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return index.isEven
                                    ? GreenBox(
                                        ontap: () {
                                          Navigator.of(
                                                  context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChapterPage(
                                                          cid: categoryProvider
                                                              .mydata
                                                              .response[index]
                                                              .cid
                                                              .toString(),
                                                          catname:
                                                              categoryProvider
                                                                  .mydata
                                                                  .response[
                                                                      index]
                                                                  .catName
                                                                  .toString())));
                                        },
                                        image: categoryProvider
                                            .mydata.response[index].cImage
                                            .toString(),
                                        categoryname: categoryProvider
                                            .mydata.response[index].catName
                                            .toString()
                                            .toUpperCase(),
                                      )
                                    : YellowBox(
                                        ontap: () {
                                          Navigator.of(
                                                  context)
                                              .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChapterPage(
                                                          cid: categoryProvider
                                                              .mydata
                                                              .response[index]
                                                              .cid
                                                              .toString(),
                                                          catname:
                                                              categoryProvider
                                                                  .mydata
                                                                  .response[
                                                                      index]
                                                                  .catName
                                                                  .toString())));
                                        },
                                        image: categoryProvider
                                            .mydata.response[index].cImage
                                            .toString(),
                                        catName: categoryProvider
                                            .mydata.response[index].catName
                                            .toString()
                                            .toUpperCase(),
                                      );
                              })),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}

class ProfileBox extends StatelessWidget {
  final String name;
  const ProfileBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    return FutureBuilder(
      future: infoProvider.fetchApi(),
      builder: (context, snapshot) {
        return Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              // width: MediaQuery.of(context).size.width,
              image: AssetImage('assets/images/ProBox.png'
                  //  "assets/images/Asset9@4x.png"
                  ),
            ),
            Positioned(
              top: 7.w,
              child: TextWidget(
                text:
                    "Hey ${infoProvider.mydata == null ? "" : infoProvider.mydata.response.studentInfo.firstName.toString().capitalize()}, Ready To Skill Up?",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textSize: 10.sp,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 9.w,
              left: 6.w,
              child: ClipPath(
                clipper: ProfileBoxShape(),
                child: SizedBox(
                  height: 22.w,
                  width: 22.w,
                  child: NetworkImageWidget(
                      erroricon: Icons.person,
                      image:
                          // 'https://tse1.mm.bing.net/th?id=OIP.NbfPECA64xbFnmW58MbWDQHaEo&pid=Api&P=0'
                          infoProvider
                              .mydata?.response.studentInfo.profileImage),
                  //     const Image(
                  //   fit: BoxFit.fill,
                  //   image: AssetImage("assets/images/g3650PPic.png"),
                  // ),
                ),
              ),
            ),
            Positioned(
              left: 25.w,
              top: 15.w,
              child: SizedBox(
                  child: Indicator(
                pw: 50.w,
              )),
            ),
          ],
        );
      },
    );
  }
}

class YellowBox extends StatelessWidget {
  final VoidCallback ontap;
  final String catName;
  final String image;
  const YellowBox({
    Key? key,
    required this.catName,
    required this.image,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: ontap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/y2.png"),
            ),
            const SizedBox(
              child: Image(
                image: AssetImage("assets/images/Asset 41@4x.png"), //line image
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15, right: 15),
              child: Image(
                image: AssetImage("assets/images/y2.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18, right: 18),
              child: Image(
                color: Colors.yellow.shade700,
                image: const AssetImage("assets/images/yelobg.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 40.w,
                          width: 40.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: NetworkImageWidget(image: image)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/AssewHITE@4x.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30.w,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Text(
                                      catName,
                                      style: TextStyle(
                                        fontSize:
                                            catName.length < 5 ? 12.sp : 10.sp,
                                        color: const Color(0xFFef436e),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 7.w,
                                  // ),
                                  SizedBox(
                                    width: 5.w,
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/image3790.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Divider(thickness: 0.1.w),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Tutorials : 178",
                                    textSize: 10.sp,
                                    color: ColorUtils.text1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Activities :",
                                    textSize: 10.sp,
                                    color: ColorUtils.text1,
                                  ),
                                  TextWidget(
                                    text: "17",
                                    color: const Color(0xFFef436e),
                                    textSize: 10.sp,
                                    // style:
                                  ),
                                  TextWidget(
                                    text: "/165",
                                    textSize: 10.sp,
                                    color: ColorUtils.text1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "XP Earned :",
                                    textSize: 10.sp,
                                    color: ColorUtils.text1,
                                  ),
                                  TextWidget(
                                      text: "17",
                                      color: const Color(0xFFef436e),
                                      textSize: 10.sp),
                                  TextWidget(
                                    text: "/165",
                                    textSize: 10.sp,
                                    color: ColorUtils.text1,
                                  ),
                                ],
                              ),
                            ),
                            letsgoButton()
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget letsgoButton() {
    return Image(
        height: 6.w,
        width: 18.w,
        fit: BoxFit.fill,
        image:
            const AssetImage('assets/tutorialonepageimage/letsGoButton.png'));
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({
    Key? key,
    required this.categoryname,
    required this.image,
    required this.ontap,
  }) : super(key: key);
  final String categoryname;
  final String image;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/Asset40@4x.png"), //line image
          ),
          const SizedBox(
            child: Image(
              image: AssetImage("assets/images/Asset 41@4x.png"), //line image
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 18,
              right: 18,
            ),
            child: Image(
              image: AssetImage("assets/images/Asset40@4x.png"), //green image
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18, right: 18),
            child: Image(
              color: Colors.lightGreen.shade300,
              image: const AssetImage("assets/images/greenbg.png"),
            ),
          ),
          GestureDetector(
            onTap: ontap,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/AssetbLACK23@4x.png"),
                      ),
                      SizedBox(
                          height: 40.w,
                          width: 40.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: NetworkImageWidget(image: image)))
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/AssewHITE@4x.png"),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 25.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: categoryname,
                                  textSize:
                                      categoryname.length > 5 ? 10.sp : 15.sp,
                                  color: Colors.purple,
                                  fontfamily: grandstander,
                                  fontWeight: FontWeight.bold,
                                  // 'ART',
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                  width: 7.w,
                                  child: const Image(
                                    image:
                                        AssetImage("assets/images/image1.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Divider(thickness: 0.2.w),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Tutorials : 178",
                                  textSize: 10.sp,
                                  color: ColorUtils.text1,
                                ),
                              ],
                            ),
                          ),
                          //
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Activities :",
                                  textSize: 10.sp,
                                  color: ColorUtils.text1,
                                ),
                                TextWidget(
                                    text: "17",
                                    color: const Color(0xFFef436e),
                                    textSize: 10.sp),
                                TextWidget(
                                  text: "/165",
                                  textSize: 10.sp,
                                  color: ColorUtils.text1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "XP Earned :",
                                  textSize: 10.sp,
                                  color: ColorUtils.text1,
                                ),
                                TextWidget(
                                    text: "17",
                                    color: const Color(0xFFef436e),
                                    textSize: 10.sp),
                                TextWidget(
                                  text: "/165",
                                  textSize: 10.sp,
                                  color: ColorUtils.text1,
                                ),
                              ],
                            ),
                          ),

                          letsgoButton()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget letsgoButton() {
    return Image(
        height: 6.w,
        width: 18.w,
        fit: BoxFit.fill,
        image:
            const AssetImage('assets/tutorialonepageimage/letsGoButton.png'));
  }
}
