// ignore_for_file: file_names

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/AddFavProvider/add_fav_provider.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Provider/Submit Task/submit_task_provider.dart';
import '../../imageUrl/imageurl.dart';
import '../../widgets/cliper.dart';
import '../NewUI/NewBottomNavBar.dart';
import '../NewUI/NewPage.dart';
import '../../utils/color_utils.dart';
import '../../utils/string_utils.dart';
import '../NewUI/Indicator.dart';
import 'Widgets/TextWidget.dart';

class T1NotSubmited extends StatefulWidget {
  final int index;
  final String thumbnail;
  final String subchapter;
  final String subchapterId;
  final String des;
  final String videoslink;
  const T1NotSubmited(
      {Key? key,
      required this.subchapter,
      required this.des,
      required this.videoslink,
      required this.thumbnail,
      required this.index,
      required this.subchapterId})
      : super(key: key);

  @override
  State<T1NotSubmited> createState() => _T1NotSubmitedState();
}

class _T1NotSubmitedState extends State<T1NotSubmited> {
  File? file;
  @override
  Widget build(BuildContext context) {
    final submitTaskProvider =
        Provider.of<SubmitTaskProvider>(context, listen: false);
    final addFavProvider = Provider.of<AddFavProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: const NewBottomnavbar(
            selectedIndex: 0,
          ),
          drawer: const NewPage(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                              height: 10.w,
                              width: 10.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13)),
                              child: Image.asset(
                                "assets/images/Asset 6@4x copy.png",
                              )),
                        );
                      }),
                      SvgPicture.asset(
                        ImageUrl.newIcon,
                        height: 15.w,
                        width: 15.w,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.w,
                ),
                const Indicator(),
                // SizedBox(
                //   height: 5.w,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subchapter.toString(),
                        // "Tutorial 1",
                        style: const TextStyle(
                            fontFamily: FontFamily.ballobhai2, fontSize: 21.33),
                        //style: baloobhai2.copyWith(fontSize: 21.33.sp),
                      ),

                      SizedBox(
                        height: 5.w,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                              clipper: ThumbNailShape(),
                              child: SizedBox(
                                  width:
                                      // 65.w,
                                      double.infinity,
                                  height: 45.w,
                                  child: Hero(
                                    tag: 'image${widget.index}}',
                                    child: NetworkImageWidget(
                                        image: widget.thumbnail),
                                  ))),
                          const Image(
                              image: AssetImage(
                                  'assets/tutorialonepageimage/g364w.png')),
                          GestureDetector(
                            onTap: () async {
                              var uri = widget.videoslink;

                              if (await canLaunchUrl(Uri.parse(uri))) {
                                await launchUrl(Uri.parse(uri));
                              } else {
                                throw 'Could not launch $uri';
                              }
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/tutorialonepageimage/path370redplay.png')),
                          ),
                        ],
                      ),

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipPath(
                            clipper: ThumbNailBottom(),
                            child: Container(
                              width: double.infinity,
                              height: 14.w,
                              color: Colors.grey,
                            ),
                          ),
                          Positioned(
                            left: 20.w,
                            child: GestureDetector(
                              onTap: () async {
                                await addFavProvider
                                    .fetchApi(widget.subchapterId);

                                Fluttertoast.showToast(
                                    msg: addFavProvider.mydata.response);
                              },
                              child: SizedBox(
                                width: 10.w,
                                child: const ImageWidget(
                                    assetName:
                                        'assets/tutorialonepageimage/FavouriteButton.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40.w,
                            child: GestureDetector(
                              onTap: () {
                                var uri = widget.videoslink;
                                Share.share(uri);
                              },
                              child: SizedBox(
                                width: 7.w,
                                child: const ImageWidget(
                                    assetName:
                                        'assets/tutorialonepageimage/ShareButton.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1.w,
                            left: 58.w,
                            child: GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(msg: "msg");
                              },
                              child: SizedBox(
                                width: 7.w,
                                child: const ImageWidget(
                                    assetName:
                                        'assets/tutorialonepageimage/HelpButton.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 7.5.w,
                            left: 58.w,
                            child: SizedBox(
                                width: 7.w,
                                child: TextWidget(
                                  text: "Help",
                                  textSize: 10.sp,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),

                      // const DesActivity(),
                      TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          //indicatorWeight: 4.w,
                          indicator: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/activityDes/g600bulebg.png',
                                  ))),
                          indicatorColor: Colors.white,
                          tabs: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(2.w),
                                    child: TextWidget(
                                      text: 'DESCRIPTION',
                                      color: ColorUtils.text1,
                                      fontWeight: FontWeight.bold,
                                      textSize: 12.sp,
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.all(2.w),
                                child: TextWidget(
                                  text: 'ACTIVITY',
                                  color: const Color(0xffee426e),
                                  fontWeight: FontWeight.bold,
                                  textSize: 12.sp,
                                )),
                          ]),
                      SizedBox(
                        height: 80.w,
                        child: TabBarView(children: [
                          Stack(
                            children: [
                              const Image(
                                  image: AssetImage(
                                      "assets/activityDes/g24debg.png")),
                              const Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Image(
                                    image: AssetImage(
                                        "assets/activityDes/g66wbg.png")),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    TextWidget(
                                      text: widget.des.toString(),
                                      textSize: 10.sp,
                                      color: ColorUtils.text1,
                                      // "Introduction To Colors",
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              Stack(
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          'assets/tutorialonepageimage/g798under revierw.png')),
                                  Positioned(
                                      top: 1.w,
                                      right: -4.w,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(20)),
                                          child: GestureDetector(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles();

                                              if (result != null) {
                                                File file = File(
                                                    result.files.single.path!);
                                                await submitTaskProvider
                                                    .fechApi(
                                                        image: file.path,
                                                        tid:
                                                            widget.subchapterId,
                                                        tasktype: 2);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Consumer<
                                                                SubmitTaskProvider>(
                                                            builder: ((context,
                                                                value, child) {
                                                  return TextWidget(
                                                      textSize: 12.sp,
                                                      color: Colors.white,
                                                      text: value
                                                          .mydata.response
                                                          .toString());
                                                }))));
                                              } else {
                                                // User canceled the picker
                                              }
                                              // await showPicker(context);
                                              // final pickedFile = await ImagePicker()
                                              //     .pickImage(source: ImageSource.gallery);

                                              // if (pickedFile != null) {
                                              //   setState(() {
                                              //     file = File(pickedFile.path);
                                              //   });
                                              // }
                                            },
                                            child: SizedBox(
                                              width: 50.w,
                                              height: 28.w,
                                              child: const Image(
                                                  image: AssetImage(
                                                      'assets/SketchingImages/g734UploadImage (1).png')),
                                            ),
                                          ))),
                                  Positioned(
                                      top: 18.w,
                                      right: 10.w,
                                      child: const ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20)),
                                          child: SizedBox(
                                            child: Image(
                                                image: AssetImage(
                                                    'assets/SketchingImages/text832uploadltet.png')),
                                          ))),
                                  Positioned(
                                    top: 1.w,
                                    right: 2.w,
                                    child: file != null
                                        ? GestureDetector(
                                            onTap: () async {
                                              await showPicker(context);
                                            },
                                            child: Container(
                                              width: 38.w,
                                              height: 28.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: FileImage(
                                                          file!.absolute)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.w),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 5)),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  Positioned(
                                    left: 12.w,
                                    top: 2.5.w,
                                    child: TextWidget(
                                        text: "Not Submitted",
                                        textSize: 9.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Positioned(
                                    left: 6.3.w,
                                    top: 3.w,
                                    child: Image(
                                        width: 4.w,
                                        height: 4.w,
                                        image: const AssetImage(
                                            'assets/SketchingImages/g944redcircle.png')),
                                  ),
                                  Positioned(
                                    left: 2.w,
                                    top: 9.w,
                                    child: SizedBox(
                                      width: 45.w,
                                      child: TextWidget(
                                        textSize: 10.sp,
                                        text:
                                            "Watch the Tutorial carefully \nto ﬁnd out the activity and \npost your submission here.",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/tutorialonepageimage/g142border.png")),
                                  const Positioned(
                                    top: -10,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/tutorialonepageimage/g914greenBg.png")),
                                  ),
                                  const Positioned(
                                    top: -5,
                                    left: 30,
                                    child: Text("Teacher’s Remarks :",
                                        style: TextStyle(
                                            fontFamily: FontFamily.ballobhai2,
                                            fontSize: 10.33,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  Positioned(
                                    width: MediaQuery.of(context).size.width -
                                        15.w,
                                    top: 8.w,
                                    left: 3.w,
                                    child: TextWidget(
                                      text:
                                          "Complete the activity to get teacher’s \nremarks!",
                                      color: ColorUtils.text1,
                                      textSize: 10.sp,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),

                      
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  showPicker(BuildContext context) async {
    // final submitTaskProvider =
    //     Provider.of<SubmitTaskProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 30.w,
              width: 25.w,
              child: Column(
                // shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 15.w,
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          final pickedfile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedfile != null) {
                            setState(() {
                              file = File(pickedfile.path);
                            });

                            // await submitTaskProvider.fechApi(
                            //     image: file!.path,
                            //     tid: widget.tid,
                            //     tasktype: 1);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Consumer<SubmitTaskProvider>(
                                    builder: ((context, value, child) {
                              return TextWidget(
                                  color: Colors.white,
                                  text: value.mydata.toString());
                            }))));
                            Navigator.of(context).pop(true);
                          }
                        },
                        title: TextWidget(text: "Gallary"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.w,
                    child: Card(
                      child: ListTile(
                        onTap: () async {
                          final pickedfile = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (pickedfile != null) {
                            setState(() {
                              file = File(pickedfile.path);
                            });
                            // await submitTaskProvider
                            //     .fechApi(
                            //   image: file!.path,
                            //   tid: widget.tid,
                            // );

                            // ScaffoldMessenger.of(
                            //         context)
                            //     .showSnackBar(SnackBar(
                            //         content: Consumer<
                            //                 SubmitTaskProvider>(
                            //             builder:
                            //                 ((context,
                            //                     value,
                            //                     child) {
                            //   return TextWidget(
                            //       color: Colors.white,
                            //       text: value.mydata
                            //           .toString());
                            // }))));
                            Navigator.of(context).pop(true);
                          }
                        },
                        title: TextWidget(text: "Camera"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
