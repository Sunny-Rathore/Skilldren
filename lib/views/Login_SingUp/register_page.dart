// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/RegisterProvider/registerprovider.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/utils/string_utils.dart';
import 'package:skilldren/views/Login_SingUp/updateprofile.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Prefrenses/prefrenses.dart';
import '../../constant.dart';
import '../../imageUrl/imageurl.dart';
import '../NewUI/NewHome.dart';

class RegisterPage extends StatefulWidget {
  final String mobnumber;
  const RegisterPage({Key? key, required this.mobnumber}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController agecontroller = TextEditingController();

  final TextEditingController gradecontroller = TextEditingController();

  TextEditingController fhonecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<AnimatorWidgetState> animationkey =
      GlobalKey<AnimatorWidgetState>();

  @override
  void initState() {
    super.initState();
    fhonecontroller.text = widget.mobnumber;
  }

  @override
  Widget build(BuildContext context) {
    final registerprovider =
        Provider.of<RegisterProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  ImageUrl.loginimage3,
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
                  bottom: 7.w,
                  child: SizedBox(
                      width: 7.w,
                      height: 7.w,
                      child: const ImageWidget(
                          assetName: 'assets/images/HStar2.png')),
                ),
                Positioned(
                  bottom: 5.w,
                  child: SizedBox(
                      width: size.width - 30.w,
                      child: FittedBox(
                          child: Text('HELLO CHAMP!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: grandstander,
                                  color: Colors.white,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ])))),
                ),
                // SizedBox(
                //     width: size.width - 10.w,
                //     child:
                //         const ImageWidget(assetName: ImageUrl.hellochamptext)),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            SizedBox(
              width: size.width - 15.w,
              child: const ImageWidget(
                assetName: 'assets/LoginImages/loginbook.png',
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  text: "What Should We Call You??",
                  color: ColorUtils.text1,
                  textSize: 15.sp,
                ),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 1.w,
                  ),
                  textfield(namecontroller, "Name", TextInputType.name),
                  SizedBox(
                    height: 4.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Your Age",
                          color: ColorUtils.text1,
                          textSize: 15.sp,
                        ),
                        TextWidget(
                          text: "Your Grade",
                          color: ColorUtils.text1,
                          textSize: 15.sp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/LoginImages/Asset 3-optimized.svg",
                              height: 11.w,
                            ),
                            SizedBox(
                                height: 10.w,
                                width: 40.w,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorHeight: 6.w,
                                  controller: agecontroller,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 3.w, bottom: 1.5.w),
                                      border: InputBorder.none),
                                ))
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/LoginImages/Asset 2-optimized.svg",
                              height: 11.w,
                            ),
                            SizedBox(
                                height: 10.w,
                                width: 40.w,
                                child: TextFormField(
                                  cursorHeight: 6.w,
                                  controller: gradecontroller,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 3.w, bottom: 1.5.w),
                                      border: InputBorder.none),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Jello(
              key: animationkey,
              child: ContinueUsingButton(ontap: () async {
                animationkey.currentState!.forward();
                if (formkey.currentState!.validate()) {
                  await registerprovider.getResiterResponse(
                      name: namecontroller.text.toString(),
                      grade: gradecontroller.text.toString(),
                      mobile: fhonecontroller.text);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(registerprovider.mydata.errormessage ??
                          registerprovider.mydata.message)));

                  if (registerprovider.mydata.message == "Success") {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString(userIdKey,
                        registerprovider.mydata.response.studnetId.toString());

                    prefs.setString(nameKey,
                        registerprovider.mydata.response.name.toString());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NewHomePage()));
                  }
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget textfield(TextEditingController controller, String hint,
      TextInputType textInputType) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          ImageUrl.textField,
          height: 11.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 84.w,
                  child: TextFormField(
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      final nonLettersRegExp = RegExp(r'[^a-zA-Z ]');
                      if (value == null ||
                          value.isEmpty ||
                          nonLettersRegExp.hasMatch(value)) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                    keyboardType: textInputType,
                    cursorHeight: 6.w,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 2.w),
                        hintStyle: const TextStyle(
                            fontFamily: FontFamily.josefinSans_Itallic,
                            fontWeight: FontWeight.w200),
                        hintText: hint,
                        border: InputBorder.none),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget mobilefield(TextEditingController controller, String hint,
      TextInputType textInputType,
      {mobile, readOnly}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          ImageUrl.textField,
          height: 11.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 84.w,
                  child: TextFormField(
                    readOnly: readOnly ?? false,
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 10 ||
                          value.length > 10 ||
                          value.isEmpty) {
                        return 'Invalid Mobile Number';
                      }
                      return null;
                    },
                    keyboardType: textInputType,
                    cursorHeight: 6.w,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 2.w,
                        ),
                        hintStyle: const TextStyle(
                            fontFamily: FontFamily.josefinSans_Itallic,
                            fontWeight: FontWeight.w200),
                        hintText: hint,
                        border: InputBorder.none),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
