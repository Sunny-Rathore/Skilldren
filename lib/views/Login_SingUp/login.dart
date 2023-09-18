// ignore_for_file: camel_case_types

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/Login_SingUp/mobnuberpage.dart';
import 'package:skilldren/views/Login_SingUp/otpPage.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Provider/loginProvider/loginprovider.dart';
import '../../constant.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,

    //  required this.name, required this.grade, required this.age
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final String name;
  final TextEditingController fhonecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<LoginProvider>(context, listen: false);
    final pref = Provider.of<Prefrenses>(context, listen: true);

    // final infoProvider =
    //     Provider.of<StudentInfoProvider>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: pref.getpref(),
      builder: ((context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HelloChampBar(size: size),
              SizedBox(
                  width: size.width,
                  child:
                      const ImageWidget(assetName: ImageUrl.logoskilldrenPng)),
              SizedBox(
                height: 7.h,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SvgPicture.asset(
                    'assets/LoginImages/blueBox-optimized.svg',
                    width: size.width,
                  ),
                  Positioned(
                    left: 8.w,
                    child: TextWidget(
                      text: 'Let’s Get You Started Quickly',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: 'Enter Your Mobile Number',
                    textSize: 15.sp,
                    color: ColorUtils.text1,
                  ),
                ),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextfieldWidgetBorder(
                      inputType: TextInputType.number,
                      mobcontroller: fhonecontroller,
                    ),
                    Consumer<LoginProvider>(builder: ((context, value, child) {
                      return Jello(
                        key: _key,
                        child: letsgoButton(
                          ontap: () async {
                            Sound.play(Audio.waterDrop);

                            _key.currentState!.forward();
                            if (formkey.currentState!.validate()) {
                              await loginprovider.fechDatatDio(
                                  fhonecontroller.text.toString());

                              if (value.mydata != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: const Duration(seconds: 1),
                                        behavior: SnackBarBehavior.floating,
                                        content: Consumer<LoginProvider>(
                                            builder: ((context, value, child) {
                                          return Text(value
                                                  .mydata.errorMessage ??
                                              value.mydata.message.toString());
                                        }))));
                                Future.delayed(
                                    const Duration(
                                      seconds: 1,
                                    ), () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OtpPage(
                                            status: "SignUp",
                                            mobnumber:
                                                fhonecontroller.text.toString(),
                                          )));
                                });

                                if (value.mydata.message == "Success") {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      userIdKey,
                                      loginprovider.mydata.response.studnetId
                                          .toString());

                                  prefs.setString(
                                      nameKey,
                                      loginprovider.mydata.response.name
                                          .toString());
                                  prefs.setBool(activityKey, true);
                                  prefs.setBool(eventsReminder, true);

                                  prefs.setBool(challengestatus, true);
                                  prefs.setBool(dailyReminder, true);
                                  pref.getpref();
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => OtpPage(
                                                status: 'Login',
                                                mobnumber: fhonecontroller.text
                                                    .toString(),
                                              )));
                                }
                              }
                            }
                          },
                        ),
                      );
                    })),
                  ],
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              TextWidget(
                text: 'T&C | Privacy Policy',
                color: Colors.grey,
                // fontWeight: FontWeight.bold,
              )
            ],
          ),
        );
      }),
    ));
  }
}

class letsgoButton extends StatelessWidget {
  final VoidCallback ontap;
  const letsgoButton({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.w,
      child: GestureDetector(
        onTap: ontap,
        child: const ImageWidget(
          assetName: ImageUrl.letsgobutton,
        ),
      ),
    );
  }
}

class HelloChampBar extends StatelessWidget {
  const HelloChampBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          ImageUrl.loginimage1,
          width: size.width,
        ),
        Positioned(
          right: 2.w,
          top: 10.w,
          child: SizedBox(
              width: 13.w,
              height: 13.w,
              child: const ImageWidget(assetName: 'assets/images/HStar.png')),
        ),
        Positioned(
          left: 3.w,
          bottom: 7.w,
          child: SizedBox(
              width: 7.w,
              height: 7.w,
              child: const ImageWidget(assetName: 'assets/images/HStar2.png')),
        ),
        Positioned(
          bottom: 5.w,
          child: Text('HELLO CHAMP!',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w900,
                  fontFamily: grandstander,
                  color: Colors.white,
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 0.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ])),
        ),
      ],
    );
  }
}
