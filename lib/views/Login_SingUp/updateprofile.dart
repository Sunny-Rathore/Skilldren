import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/Login_SingUp/edit_profle.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Provider/Student Info/student_info_provider.dart';
import '../NewUI/NewHome.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final GlobalKey<AnimatorWidgetState> _key1 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key2 = GlobalKey<AnimatorWidgetState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
            future: infoProvider.fetchApi(),
            builder: ((context, snapshot) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          width: size.width,
                          height: 83.w,
                        ),
                        SvgPicture.asset(
                          ImageUrl.loginimage2,
                          width: size.width,
                        ),
                        Positioned(
                          right: 2.w,
                          top: 10.w,
                          child: SizedBox(
                              width: 13.w,
                              height: 13.w,
                              child: const ImageWidget(
                                  assetName: 'assets/images/HStar.png')),
                        ),
                        Positioned(
                          left: 3.w,
                          bottom: 50.w,
                          child: SizedBox(
                              width: 7.w,
                              height: 7.w,
                              child: const ImageWidget(
                                  assetName: 'assets/images/HStar2.png')),
                        ),
                        Positioned(
                            bottom: 0.h,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditProfilePage(
                                            city: infoProvider.mydata.response
                                                .studentInfo.cityName,
                                            name: infoProvider.mydata.response
                                                .studentInfo.firstName,
                                            lastname: infoProvider.mydata
                                                .response.studentInfo.lastName,
                                            email: infoProvider.mydata.response
                                                .studentInfo.email,
                                            dob: infoProvider.mydata.response
                                                .studentInfo.dateOfBirth,
                                            address: infoProvider.mydata
                                                .response.studentInfo.address,
                                            country: infoProvider.mydata
                                                .response.studentInfo.country,
                                            state: infoProvider.mydata.response
                                                .studentInfo.stateName,
                                            mobNumber: infoProvider.mydata
                                                .response.studentInfo.mobile,
                                            image: infoProvider.mydata.response
                                                .studentInfo.profileImage,
                                            pincode: infoProvider
                                                .mydata
                                                .response
                                                .studentInfo
                                                .pincodeName,
                                          )));
                                },
                                child: SizedBox(
                                  width: 45.w,
                                  height: 45.w,
                                  child: const ImageWidget(
                                    assetName:
                                        'assets/myprofile/NewUpdateIcon.png',
                                  ),
                                ))),
                        Positioned(
                          top: 10.h,
                          child: Text('WeLCOME BACK',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: grandstander,
                                  color: Colors.white,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ])),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 12.h,
                    // ),
                    TextWidget(
                      text: name.toString().capitalize(),
                      textSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.text1,
                    ),
                    SizedBox(height: 3.h),
                    const ImageWidget(assetName: 'assets/images/Heart.png'),

                    SizedBox(height: 3.h),
                    TextWidget(
                      text: "Happy to see you again!",
                      fontWeight: FontWeight.w500,
                      textSize: 15.sp,
                    ),
                    SizedBox(height: 3.h),

                    Swing(
                      key: _key1,
                      child: Updatebutton(
                        ontap: () async {
                          _key1.currentState!.forward();
                          await Sound.play(Audio.waterDrop);
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                      city: infoProvider
                                          .mydata.response.studentInfo.cityName,
                                      name: infoProvider.mydata.response
                                          .studentInfo.firstName,
                                      lastname: infoProvider
                                          .mydata.response.studentInfo.lastName,
                                      email: infoProvider
                                          .mydata.response.studentInfo.email,
                                      dob: infoProvider.mydata.response
                                          .studentInfo.dateOfBirth,
                                      address: infoProvider
                                          .mydata.response.studentInfo.address,
                                      country: infoProvider
                                          .mydata.response.studentInfo.country,
                                      state: infoProvider.mydata.response
                                          .studentInfo.stateName,
                                      mobNumber: infoProvider
                                          .mydata.response.studentInfo.mobile,
                                      image: infoProvider.mydata.response
                                          .studentInfo.profileImage,
                                      pincode: infoProvider.mydata.response
                                          .studentInfo.pincodeName,
                                    )));
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 3.h),
                    SvgPicture.asset(
                      'assets/svg images/tutorialparts/Dashedline-optimized.svg',
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 3.h),
                    Jello(
                      key: _key2,
                      child: ContinueUsingButton(
                        ontap: () async {
                          _key2.currentState!.forward();
                          await Sound.play(Audio.waterDrop);
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const NewHomePage()));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}

class Updatebutton extends StatelessWidget {
  const Updatebutton({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: ontap,
          child: SizedBox(
              width: 50.w,
              child:
                  const ImageWidget(assetName: ImageUrl.UpdateProfielButton)),
        ),
        GestureDetector(
          onTap: ontap,
          child: TextWidget(
            text: 'Update Profile',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ContinueUsingButton extends StatelessWidget {
  final VoidCallback ontap;
  const ContinueUsingButton({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
            onTap: ontap,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20.w,
              child: const ImageWidget(assetName: ImageUrl.ContinueUsingApp),
            )),
        GestureDetector(
          onTap: ontap,
          child: TextWidget(
            text: 'Continue Using The App',
            fontWeight: FontWeight.bold,
            textSize: 18.sp,
            color: ColorUtils.text1,
          ),
        )
      ],
    );
  }
}

// extension Padding on num { 
//   SizedBox get ph => SizedBox(height: toDouble());
//   SizedBox get pw => SizedBox(width: toDouble());
// }
