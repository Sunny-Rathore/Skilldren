// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/views/Login_SingUp/login.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';
import 'package:skilldren/views/pricing%20Plans/pricingplans.dart';
import 'package:url_launcher/url_launcher.dart';

import '../NewUI/NewPage.dart';
import '../pages/Widgets/Imagewidget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool activity_status = true;
  // bool on1 = true;
  // bool on2 = true;
  // bool on3 = true;
  // bool on4 = true;
  List<String> settings = [
    "Activity Status",
    "Challenge Status",
    "Daily Reminder",
    "Events Reminder"
  ];

  // @override
  // void initState() {
  //   pref();

  //   super.initState();
  // }

  // pref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   userIdVal = preferences.getString(userIdKey);
  //   name = preferences.getString(nameKey);
  //   actitvi_status = preferences.getBool(activityKey);
  // }

  @override
  Widget build(BuildContext context) {
    final prefProvider = Provider.of<Prefrenses>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
      drawer: const NewPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg images/tutorialparts/my profile asset without notch.svg",
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
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
                      TextWidget(
                        text: 'Edit Profile',
                        textSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const RedTitleBar(title: "Genral Settiings"),
            SizedBox(
              height: 2.w,
            ),
            geytile(context, "About Us-Visit The Website", () async {
              var uri = 'https://skilldren.com';
              if (await canLaunchUrl(Uri.parse(uri))) {
                launchUrl(Uri.parse(uri));
              } else {
                throw "Can't launch Url :$uri";
              }
            }),
            geytile(context, "Check For Updates", () {}),
            geytile(context, "Log Out", () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.remove(userIdKey);
              preferences.remove(nameKey);
              Fluttertoast.showToast(msg: 'Loged Out');

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            }),
            SizedBox(
              height: 10.w,
            ),
            const RedTitleBar(title: "Notification  Settiings"),
            SizedBox(
              height: 2.w,
            ),
            Consumer<Prefrenses>(builder: ((context, value, child) {
              return notificationtile(context, "Activity Status",
                  value.actitvi_status == true ? 'ON' : "OFF", () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                if (value.actitvi_status == true) {
                  pref.setBool(activityKey, false);

                  prefProvider.getpref();
                  //("provider>>${value.actitvi_status}");
                } else if (value.actitvi_status == false) {
                  pref.setBool(activityKey, true);

                  prefProvider.getpref();
                  // print("provider1>>${value.actitvi_status}");
                }
              });
            })),
            Consumer<Prefrenses>(builder: ((context, value, child) {
              return notificationtile(context, "Challenge Status",
                  value.challange_status == true ? 'ON' : "OFF", () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                // pref.setBool(challengestatus, true);
                if (value.challange_status == true) {
                  pref.setBool(challengestatus, false);

                  prefProvider.getpref();
//print("provider>>${value.challange_status}");
                } else if (value.challange_status == false) {
                  pref.setBool(challengestatus, true);

                  prefProvider.getpref();
                  // print("provider1>>${value.challange_status}");
                }
              });
            })),
            Consumer<Prefrenses>(builder: ((context, value, child) {
              return notificationtile(context, "Daily Reminder",
                  value.daily_Reminder == true ? 'ON' : "OFF", () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                // pref.setBool(dailyReminder, true);
                if (value.daily_Reminder == true) {
                  pref.setBool(dailyReminder, false);

                  prefProvider.getpref();
                } else if (value.daily_Reminder == false) {
                  pref.setBool(dailyReminder, true);

                  prefProvider.getpref();
                }
              });
            })),
            Consumer<Prefrenses>(builder: ((context, value, child) {
              return notificationtile(context, "Events Reminder",
                  value.evenst_Reminder == true ? 'ON' : "OFF", () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                //pref.setBool(eventsReminder, true);
                if (value.evenst_Reminder == true) {
                  pref.setBool(eventsReminder, false);

                  prefProvider.getpref();
                } else if (value.evenst_Reminder == false) {
                  pref.setBool(eventsReminder, true);

                  prefProvider.getpref();
                }
              });
            })),
          ],
        ),
      ),
    );
  }

  Padding geytile(BuildContext context, String title, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          GestureDetector(
            onTap: ontap,
            child: SvgPicture.asset(
              'assets/svg images/tutorialparts/geyBox-optimized.svg',
              width: MediaQuery.of(context).size.width - 50,
            ),
          ),
          Positioned(
            left: 3.w,
            child: GestureDetector(onTap: ontap, child: TextWidget(text: title)),
          )
        ],
      ),
    );
  }

  Padding notificationtile(
      BuildContext context, String title, String onOff, VoidCallback ontap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SvgPicture.asset(
            'assets/svg images/tutorialparts/geyBox-optimized.svg',
            width: MediaQuery.of(context).size.width - 50,
          ),
          Positioned(
            right: 0,
            child: SizedBox(
                height: 8.w,
                width: 18.w,
                child: const ImageWidget(
                    assetName: 'assets/EditProfile/OnWithoutText.png')),
          ),
          Positioned(left: 3.w, child: TextWidget(text: title)),
          Positioned(
              right: 5.w,
              child: GestureDetector(
                onTap: ontap,
                child: TextWidget(
                  text: onOff,
                  textSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
