// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/views/Setting/Setings.dart';
import 'package:skilldren/views/pages/My%20Subscription/mysubscription.dart';
import 'package:skilldren/views/pages/ReferAfrind/ReferandEarn.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/Profile.dart';
import '../../utils/color_utils.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  GlobalKey<AnimatorWidgetState> animationkey =
      GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: 10.w,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/Drawerimage.png',
                    ))),
            child: Stack(
              children: [
                Positioned(
                  right: 15.w,
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: SizedBox(
                    width: 5.w,
                    height: 5.w,
                    child: Image.asset("assets/images/menu_start.png"),
                  ),
                ),
                Positioned(
                  left: 50.w,
                  bottom: 0.w,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(200)),
                    child: SizedBox(
                      width: 31.w,
                      child: Image.asset("assets/images/Asset 6@4x-100.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  right: 35.w,
                  top: 35.w,
                  child: SizedBox(
                    height: 5.w,
                    width: 5.w,
                    child: Image.asset("assets/images/Asset 3@4x-100.jpg"),
                  ),
                ),
                drawerUi(context),
                Positioned(
                  top: 20.w,
                  right: -12.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: Image.asset("assets/images/menu_cancel.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column drawerUi(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageUrl.newIcon,
                      height: 12.w,
                      width: 12.w,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                        width: 45.w,
                        child: const ImageWidget(
                            assetName: ImageUrl.SkilldrenText)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Divider(
                  thickness: 3,
                ),
              ),
              row("assets/images/menu_person.jpg", " My Profile", Colors.red,
                  Colors.orange, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyProfilePage()));
              }),
              row('assets/images/menu_location.jpg', "invite and Earn XP",
                  Colors.green, Colors.green.shade200, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReferandEarn()));
              }),
              row('assets/images/Menu_Lock.jpg', "Subscribe Plans", Colors.blue,
                  Colors.blue.shade200, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MySubsCriptionPage()));
              }),
              row('assets/images/menu_msg.png', "Support", Colors.red,
                  Colors.red.shade200, () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'recipient@example.com',
                );
                final String emailUrl = params.toString();

                if (await canLaunchUrl(Uri.parse(emailUrl))) {
                  await launchUrl(Uri.parse(emailUrl));
                } else {
                  throw 'Cant Launch $emailUrl';
                }
              }),
              row('assets/images/menu_fav.png', "About Us",
                  Colors.yellow.shade600, Colors.yellow.shade200, () {}),
              row('assets/images/menu_location.jpg', "Settings", Colors.green,
                  Colors.green.shade200, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              }),
              SizedBox(
                height: 15.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 35.w),
                child: const Divider(
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextWidget(
                    text: "FOLLOW US FOR DAILY UPDATES!",
                    textSize: 12.sp,
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    row('assets/images/Whatsapp.png', "", Colors.green,
                        Colors.green.shade200, () {},
                        left: 0.0),
                    row('assets/images/Fb.png', "", Colors.red,
                        Colors.red.shade200, () {},
                        left: 0.0),
                    row('assets/images/Insta.png', "", Colors.blue,
                        Colors.blue.shade200, () {},
                        left: 0.0),
                    row('assets/images/YouTube.png', "", Colors.blue,
                        Colors.blue.shade200, () {},
                        left: 0.0),
                  ],
                ),
              ),
              SizedBox(
                height: 8.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 35.w),
                child: const Divider(
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 12.w,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: GestureDetector(
                      onTap: () async {
                        Sound.play(Audio.waterDrop);
                        animationkey.currentState!.forward();
                        var uri = "tel:{+912211334455}";

                        if (await canLaunchUrl(Uri.parse(uri))) {
                          await launchUrl(Uri.parse(uri));
                        } else {
                          throw 'Cant Launch $uri';
                        }
                      },
                      child: Jello(
                        key: animationkey,
                        child: Container(
                          width: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child:
                              Image.asset('assets/images/NewTalklToExpert.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3.5.w,
                    child: GestureDetector(
                      onTap: () async {
                        Sound.play(Audio.waterDrop);
                        animationkey.currentState!.forward();
                        var uri = "tel:{+912211334455}";

                        if (await canLaunchUrl(Uri.parse(uri))) {
                          await launchUrl(Uri.parse(uri));
                        } else {
                          throw 'Cant Launch $uri';
                        }
                      },
                      child: TextWidget(
                        text: 'Talk to Our Expert',
                        textSize: 13.sp,
                        color: ColorUtils.text1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.w),
                child: TextWidget(
                    text:
                        "*For any application related\n Queries or information regarding\n offers and discounts.",
                    textSize: 10.sp,
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget row(String iconename, String tittle, Color iconColor, boxColor,
      VoidCallback ontap,
      {left}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 10.w,
        top: 3.w,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          children: [
            Container(
                height: 8.w,
                width: 8.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(10)),
                ),
                child: Image.asset(iconename)),
            SizedBox(
              width: 4.w,
            ),
            TextWidget(
                text: tittle,
                textSize: 15.sp,
                color: ColorUtils.text1,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
