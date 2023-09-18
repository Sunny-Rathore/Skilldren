// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/OtpProvider/otpprovider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/imageUrl/imageurl.dart';
import 'package:skilldren/views/Login_SingUp/login.dart';
import 'package:skilldren/views/Login_SingUp/register_page.dart';
import 'package:skilldren/views/Login_SingUp/updateprofile.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';

import '../../utils/color_utils.dart';
import '../pages/Widgets/TextWidget.dart';

class OtpPage extends StatefulWidget {
  final String status;
  const OtpPage({Key? key, required this.mobnumber, required this.status})
      : super(key: key);
  final String mobnumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final GlobalKey<AnimatorWidgetState> animationkey =
      GlobalKey<AnimatorWidgetState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final otpProvider = Provider.of<OtpProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              HelloChampBar(size: size),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        text: 'Enter OTP',
                        textSize: 15.sp,
                        color: ColorUtils.text1,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        otpFiled(otp1, focusNode1),
                        otpFiled(otp2, focusNode2),
                        otpFiled(otp3, focusNode3),
                        otpFiled(otp4, focusNode4),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Swing(
                      key: animationkey,
                      child: letsgoButton(ontap: () async {
                        animationkey.currentState!.forward();
                        Sound.play(Audio.waterDrop);
                        await otpProvider.fetchApiResponse(
                            mobnumber: widget.mobnumber,
                            otp: otp1.text.toString() +
                                otp2.text.toString() +
                                otp3.text.toString() +
                                otp4.text.toString());
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            content:
                                Text(otpProvider.maydata.response.toString())));

                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => widget.status == "Login"
                                      ? const UpdateProfile()
                                      : RegisterPage(
                                          mobnumber: widget.mobnumber)));
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "1";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "1";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "1";
                          });
                        } else {
                          setState(() {
                            otp4.text = "1";
                          });
                        }
                        // focusNode1.requestFocus();
                      },
                      child: const ImageWidget(assetName: ImageUrl.one)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "2";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "2";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "2";
                          });
                        } else {
                          setState(() {
                            otp4.text = "2";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.two)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "3";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "3";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "3";
                          });
                        } else {
                          setState(() {
                            otp4.text = "3";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.three)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "4";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "4";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "4";
                          });
                        } else {
                          setState(() {
                            otp4.text = "4";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.four)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "5";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "5";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "5";
                          });
                        } else {
                          setState(() {
                            otp4.text = "5";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.five)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "6";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "6";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "6";
                          });
                        } else {
                          setState(() {
                            otp4.text = "6";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.six)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "7";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "7";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "7";
                          });
                        } else {
                          setState(() {
                            otp4.text = "7";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.seven)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "8";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "8";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "8";
                          });
                        } else {
                          setState(() {
                            otp4.text = "8";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.Eight)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "9";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "9";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "9";
                          });
                        } else {
                          setState(() {
                            otp4.text = "9";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.nine)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        if (otp4.text.isNotEmpty) {
                          setState(() {
                            otp4.clear();
                            // otp1.text = "1";
                          });
                        } else if (otp3.text.isNotEmpty) {
                          setState(() {
                            otp3.clear();
                          });
                        } else if (otp2.text.isNotEmpty) {
                          setState(() {
                            otp2.clear();
                          });
                        } else {
                          setState(() {
                            otp1.clear();
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.left)),
                  InkWell(
                      onTap: () {
                        if (otp1.text.isEmpty) {
                          setState(() {
                            otp1.text = "0";
                          });
                        } else if (otp2.text.isEmpty) {
                          setState(() {
                            otp2.text = "0";
                          });
                        } else if (otp3.text.isEmpty) {
                          setState(() {
                            otp3.text = "0";
                          });
                        } else {
                          setState(() {
                            otp4.text = "0";
                          });
                        }
                      },
                      child: const ImageWidget(assetName: ImageUrl.Zero)),
                  InkWell(
                      onTap: () {
                        // TextInputAction.next;
                      },
                      child: const ImageWidget(assetName: ImageUrl.Riht)),
                ],
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          )
        ],
      ),
    );
  }

  Stack otpFiled(TextEditingController controller, FocusNode focusNode) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/LoginImages/OtpFiled-optimized.svg',
          height: 12.w,
        ),
        SizedBox(
            width: 10.w,
            child: TextFormField(
              cursorHeight: 0,
              cursorWidth: 0,
              // maxLength: 1,
              maxLines: 1,
              showCursor: true,
              textInputAction: TextInputAction.next,
              controller: controller,
              readOnly: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 3.w),
                  border: InputBorder.none),
            )),
      ],
    );
  }
}
