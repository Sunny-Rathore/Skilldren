import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Submit%20Task/submit_task_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/Participate/participate.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../../widgets/cliper.dart';
import '../../NewUI/NewBottomNavBar.dart';

class TaskPending extends StatefulWidget {
  final String tid;
  final String tittle;
  final String time;
  final String xp;
  final String image;
  final String des;
  final String tasktype;

  const TaskPending(
      {Key? key,
      required this.tittle,
      required this.time,
      required this.xp,
      required this.image,
      required this.tid,
      required this.des,
      required this.tasktype})
      : super(key: key);

  @override
  State<TaskPending> createState() => _TaskPendingState();
}

class _TaskPendingState extends State<TaskPending> {
  File? file;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final submitTaskProvider =
        Provider.of<SubmitTaskProvider>(context, listen: false);
    GlobalKey<AnimatorWidgetState> _animationkey =
        GlobalKey<AnimatorWidgetState>();
    // final getAllTaskProvider =
    //     Provider.of<GetAllTaskProvier>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.w),
        child: BlueAppBar(size: size),
      ),
      bottomNavigationBar: const NewBottomnavbar(selectedIndex: 3),
      drawer: const NewPage(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BlueAppBar(size: size),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Indicator(),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      ImageWidget(
                          assetName: widget.tasktype == "Remaning"
                              ? 'assets/TaskIncomplete/greyline.png'
                              : widget.tasktype == 'Under assesment'
                                  ? 'assets/TaskPending/bluelite.png'
                                  : 'assets/TaskCompleted/greenline.png'),
                      Positioned(
                        top: 1.w,
                        left: 6.w,
                        child: TextWidget(
                          text: 'WEEKLY TASK',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 12.sp,
                        ),
                      ),
                      Positioned(
                        left: 7.w,
                        top: 8.w,
                        child: TextWidget(
                          text: widget.tittle,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          textSize: 15.sp,
                        ),
                      ),
                      Positioned(
                        top: 6.w,
                        right: 6.w,
                        child: TextWidget(
                          text: '+' + widget.xp + 'XP',
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          textSize: 20.sp,
                        ),
                      ),
                      Positioned(
                        bottom: 1.2.w,
                        left: 5.w,
                        child: TextWidget(
                          text: widget.time,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text:
                        'Complete the Daily and Weekly Tasks to Earn XP & a chance to get featured on all the Skilldren Social Media Platforms.Its your chance to become a kid influencer!',
                    fontWeight: FontWeight.w400,
                    textSize: 11.sp,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      const ImageWidget(
                          assetName: 'assets/TaskPending/greyBox.png'),
                      Positioned(
                          bottom: 1.5.w,
                          left: 2.3.w,
                          child: ClipPath(
                            clipper: RPSCustomPainter(),
                            child: Container(
                                height: 33.3.w,
                                width: 45.6.w,
                                color: ColorUtils.text1),
                          )),
                      Positioned(
                        bottom: 2.w,
                        left: 2.8.w,
                        child: GestureDetector(
                            onTap: () async {
                              String path = widget.image;

                              await GallerySaver.saveImage(path).then((value) {
                                Fluttertoast.showToast(msg: "Image is saved");
                              });
                            },
                            child: ClipPath(
                              clipper: RPSCustomPainter(),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 3)),
                                  height: 32.3.w,
                                  width: 44.6.w,
                                  child: NetworkImageWidget(
                                    image: widget.image,
                                  )),
                            )),
                      ),
                      Positioned(
                          top: 6.w,
                          right: 20.w,
                          child: SizedBox(
                            width: 10.w,
                            height: 10.w,
                            child: ImageWidget(
                                assetName: widget.tasktype == "Remaning"
                                    ? 'assets/TaskPending/Remaing@2x.png'
                                    : widget.tasktype == 'Under assesment'
                                        ? 'assets/TaskPending/Pending@2x.png'
                                        : 'assets/TaskPending/Completed@2x.png'),
                          )),
                      Positioned(
                        top: 16.w,
                        right:
                            widget.tasktype == 'Under assesment' ? 10.w : 17.w,
                        child: TextWidget(
                          text: widget.tasktype.toUpperCase(),
                          // "UNDER ASSESSMENT",
                          fontWeight: FontWeight.bold,
                          textSize: 10.sp,
                        ),
                      ),
                      Positioned(
                          top: 22.w,
                          right: 15.w,
                          child: Jello(
                            key: _animationkey,
                            child: SizedBox(
                              width: 20.w,
                              height: 8.w,
                              child: ImageWidget(
                                  assetName: widget.tasktype == "Remaning"
                                      ? 'assets/TaskPending/LetsoGo.png'
                                      : 'assets/TaskPending/Submitted.png'),
                            ),
                          )),
                      Positioned(
                        top: 23.w,
                        right: 13.w,
                        child: InkWell(
                          onTap: widget.tasktype != "Remaning"
                              ? () {
                                  _animationkey.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  Fluttertoast.showToast(
                                      msg:
                                          'You have already attempted the task');
                                }
                              : () async {
                                  _animationkey.currentState!.forward();
                                  Sound.play(Audio.waterDrop);
                                  final picker = ImagePicker();

                                  final pickedFile = await picker.pickVideo(
                                      maxDuration: const Duration(minutes: 1),
                                      source:
                                          ImageSource.gallery); // For videos

                                  if (pickedFile != null) {
                                    File mediaFile = File(pickedFile.path);

                                    await submitTaskProvider.fechApi(
                                        image: mediaFile.path,
                                        tid: widget.tid,
                                        tasktype: 1);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content:
                                            Consumer<SubmitTaskProvider>(
                                                builder:
                                                    ((context, value, child) {
                                      return TextWidget(
                                          textSize: 12.sp,
                                          color: Colors.white,
                                          text:
                                              value.mydata.response.toString());
                                    }))));
                                  } else {
                                    // User canceled the picker
                                  }
                                },
                          child: SizedBox(
                            height: 7.w,
                            width: 25.w,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const ImageWidget(
                          assetName: 'assets/TaskPending/yellowline.png'),
                      TextWidget(
                        text: 'RULES',
                        fontWeight: FontWeight.bold,
                        textSize: 20,
                        color: Colors.purple,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      text: widget.des,
                      // '1) You can draw any kind of duck using any color type and combination. Drawing the above picture is not compulsory.\n2) The artwork will be judged by overall sketch andcolor composition. The better you draw and fill, the more you score.',
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      textSize: 13.sp,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
