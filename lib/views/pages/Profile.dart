// ignore_for_file: file_names, camel_case_types, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Student%20Rank/student_rank.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/Fav%20Videos/fav_videos.dart';
import 'package:skilldren/views/Login_SingUp/edit_profle.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/leaderBorad%20Rank%20one/FristRank.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Provider/FavVideoProvider/fav_video_list.dart';
import '../../Provider/Student Info/student_info_provider.dart';
import '../NewUI/NewBottomNavBar.dart';
import 'Widgets/TextWidget.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  // final ReceivePort _port = ReceivePort();

  // @override
  // void initState() {
  //   super.initState();

  //   IsolateNameServer.registerPortWithName(
  //       _port.sendPort, 'downloader_send_port');
  //   _port.listen((dynamic data) {
  //     String id = data[0];
  //     DownloadTaskStatus status = data[1];
  //     int progress = data[2];
  //     setState(() {});
  //   });

  //   FlutterDownloader.registerCallback(downloadCallback);
  // }

  // @pragma('vm:entry-point')
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send?.send([id, status, progress]);
  // }

  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  //   super.dispose();
  // }

  // void downloadPdf(String url, fileName) async {
  //   final status = await Permission.storage.request();
  //   if (status.isGranted) {
  //     final externalDir = await getExternalStorageDirectory();
  //     //final newFilePath = '${externalDir!.path}/certificate';
  //     final taskId = await FlutterDownloader.enqueue(
  //         url: url,
  //         headers: {}, // optional: header send with url (auth token etc)
  //         savedDir: externalDir!.path,
  //         showNotification:
  //             true, // show download progress in status bar (for Android)
  //         openFileFromNotification: true,
  //         saveInPublicStorage: true,
  //         fileName: fileName);
  //   } else {
  //     debugPrint("no permition");
  //   }
  // }
  Future<void> downloadPDF(String pdfUrl, String pdfFileName) async {
    final Directory? directory = await getExternalStorageDirectory();
    final taskId = await FlutterDownloader.enqueue(
      url: pdfUrl,
      savedDir: directory!.path,
      fileName: pdfFileName,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<StudentInfoProvider>(context, listen: false);
    final rank = Provider.of<StudentRankProvider>(context, listen: false);
    final favList = Provider.of<FavVideoListProvider>(context, listen: false);
    return Scaffold(
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
        drawer: const NewPage(),
        body: FutureBuilder(
          future: infoProvider.fetchApi(),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SizedBox(
                              height: 12.w,
                              width: 12.w,
                              child: const ImageWidget(
                                  assetName:
                                      'assets/images/rank1/menuicon.png')),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                      city: infoProvider.mydata?.response
                                              ?.studentInfo?.cityName ??
                                          '',
                                      name: infoProvider.mydata?.response
                                              ?.studentInfo?.firstName ??
                                          '',
                                      lastname: infoProvider.mydata?.response
                                              ?.studentInfo?.lastName ??
                                          '',
                                      email: infoProvider.mydata?.response
                                              ?.studentInfo?.email ??
                                          '',
                                      dob: infoProvider.mydata?.response
                                              ?.studentInfo?.dateOfBirth ??
                                          '',
                                      address: infoProvider.mydata?.response
                                              ?.studentInfo?.address ??
                                          '',
                                      country: infoProvider.mydata?.response
                                              ?.studentInfo?.country ??
                                          '',
                                      state: infoProvider.mydata?.response
                                              ?.studentInfo?.stateName ??
                                          '',
                                      mobNumber: infoProvider.mydata?.response
                                              ?.studentInfo?.mobile ??
                                          '',
                                      image: infoProvider.mydata?.response
                                              ?.studentInfo?.profileImage ??
                                          '',
                                      pincode: infoProvider.mydata?.response
                                              ?.studentInfo?.pincodeName ??
                                          '',
                                    )));
                          },
                          child: SizedBox(
                            height: 12.w,
                            width: 12.w,
                            child: const ImageWidget(
                                assetName:
                                    'assets/myprofile/Edit_button-removebg-preview.png'),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const ImageWidget(
                            assetName: 'assets/myprofile/NewBg.png'),
                        SizedBox(
                          //height: 43.w,
                          width: 40.w,
                          child: const ImageWidget(
                              assetName: 'assets/myprofile/NewCirculeBg.png'),
                        ),
                        Positioned(
                          top: 5.5.w,
                          left: 29.5.w,
                          child: ClipOval(
                              child: SizedBox(
                            height: 35.w,
                            width: 35.w,
                            child: Hero(
                              tag: "DP",
                              child: NetworkImageWidget(
                                image: infoProvider
                                    .mydata.response.studentInfo.profileImage,
                              ),
                            ),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    TextWidget(
                      text: infoProvider.mydata == null
                          ? ""
                          : infoProvider.mydata.response.studentInfo.firstName
                              .toString()
                              .capitalize(),

                      // name.toString().capitalize(),
                      // infoProvider.mydata == null
                      //     ? ""
                      //     : infoProvider.mydata.response.firstName
                      //         .toString()
                      //         .capitalize(),
                      fontWeight: FontWeight.bold,
                      textSize: 15.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text:
                              "${infoProvider.mydata.response.studentInfo.age}",
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        TextWidget(
                            text: " Y/O, Class",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        TextWidget(
                          text:
                              " ${infoProvider.mydata.response.studentInfo.grade}",
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 33.w,
                          width: MediaQuery.of(context).size.width,
                          child: const ImageWidget(
                              assetName: 'assets/myprofile/NewBuleBox.png'),
                        ),
                        Positioned(
                          left: 11.w,
                          child: TextWidget(
                              text: '1',
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                        Positioned(
                          left: 20.w,
                          top: 9.w,
                          child: TextWidget(
                            textSize: 10.sp,
                            text: "Level 1 CHALLENGER",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 3.w,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        "assets/images/AssetIndicagtorempty.png",
                                      ))),
                            ),
                            Positioned(
                              // left: 6.w,
                              child: AnimatedContainer(
                                color: Colors.yellow,
                                duration: const Duration(seconds: 1),
                                width: rank.mydata == null
                                    ? 22.w
                                    : rank.mydata.response.studentXpPoint
                                            .toDouble() +
                                        10.w,
                                height: 2.2.w,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 20.w,
                          bottom: 9.w,
                          child: TextWidget(
                            text: rank.mydata == null
                                ? ""
                                : "${rank.mydata.response.studentXpPoint.toString()}/ ${rank.mydata.response.totalXpPoint.toString()} XP",
                            textSize: 9.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    leaderboardBox(rank),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                                width: 7.w,
                                height: 7.w,
                                image: const AssetImage(
                                    'assets/myprofile/g6594LIKEBUTTON.png')),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextWidget(
                              text: "Favourite Videos",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              textSize: 15.sp,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FavVideosList(),
                            ));
                          },
                          child: TextWidget(
                            textSize: 13.sp,
                            text: "View All >>",
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    favvideoView(favList),
                    SizedBox(
                      height: 12.w,
                    ),
                    Row(
                      children: [
                        const Image(
                            image: AssetImage(
                                'assets/myprofile/Downloadbutton.png')),
                        SizedBox(
                          width: 5.w,
                        ),
                        TextWidget(
                          textSize: 15.sp,
                          text: "My Certificates",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    infoProvider.mydata?.response.certificateMsg != null
                        ? TextWidget(
                            text: infoProvider.mydata.response.certificateMsg
                                .toString())
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: infoProvider
                                    .mydata?.response.certificateList.length ??
                                0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.w),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        String pdfUrl = infoProvider
                                            .mydata
                                            ?.response
                                            .certificateList[index]
                                            .certificateImage;
                                        String pdfFileName = infoProvider
                                            .mydata
                                            ?.response
                                            .certificateList[index]
                                            .certificateTitle;

                                        downloadPDF(pdfUrl, pdfFileName);
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/myprofile/Certificate.png')),
                                    ),
                                    Positioned(
                                      top: 0.5.w,
                                      left: 10.w,
                                      child: GestureDetector(
                                        onTap: () async {
                                          String pdfUrl = infoProvider
                                              .mydata
                                              ?.response
                                              .certificateList[index]
                                              .certificateImage;
                                          String pdfFileName = infoProvider
                                              .mydata
                                              ?.response
                                              .certificateList[index]
                                              .certificateTitle;

                                          downloadPDF(pdfUrl, pdfFileName);
                                        },
                                        child: TextWidget(
                                            textSize: 12.sp,
                                            text:
                                                '${infoProvider.mydata?.response.certificateList[index].certificateDate ?? ''}'
                                                ' - ${infoProvider.mydata?.response.certificateList[index].certificateTitle ?? ''}'),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                  ],
                ),
              ),
            );
          }),
        ));
  }

  FutureBuilder<void> favvideoView(FavVideoListProvider favList) {
    return FutureBuilder(
      future: favList.fetchApi(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : favList.mydata?.response?.length == 0
                ? TextWidget(text: "No Videos Added")
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(2.0.w),
                      child: Row(
                          children: List.generate(
                              favList.mydata?.response?.length ?? 0,
                              (index) => favVideos(
                                    thumbnail: favList
                                        .mydata?.response[index].videoThumbnail,
                                    link: favList.mydata?.response[index].video,
                                  ))),
                    ),
                  );
      },
    );
  }

  FutureBuilder<void> leaderboardBox(StudentRankProvider rank) {
    return FutureBuilder(
      future: rank.fechApi(),
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FirstRank()));
          },
          child: Stack(
            children: [
              const ImageWidget(assetName: 'assets/myprofile/NewRedBoxBg.png'),
              Positioned(
                top: 11.5.w,
                left: 7.w,
                child: Row(
                  children: [
                    TextWidget(
                      textSize: 14.sp,
                      text: "#",
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    TextWidget(
                      textSize: 10.sp,
                      text: rank.mydata == null
                          ? ""
                          : rank.mydata.response.studentRank,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                      height: 8.w,
                      width: 8.w,
                      child: const ImageWidget(
                          assetName: 'assets/myprofile/NewPersonIcons.png'),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextWidget(
                      textSize: 10.sp,
                      text: rank.mydata == null
                          ? ""
                          : rank.mydata.response.studentName
                              .toString()
                              .capitalize(),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 13.w,
                left: 68.w,
                child: TextWidget(
                  textSize: 10.sp,
                  text: rank.mydata == null
                      ? ""
                      : rank.mydata.response.studentXpPoint.toString() + 'XP',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Positioned blueBox(double? left, top, height, width, Color? color) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
          color: color ?? Colors.blue.shade200,
          // Colors.yellow.shade200,
          height: height,
          width: width,
          child: const Image(
              image: AssetImage('assets/myprofile/g2304blueline.png'))),
    );
  }
}

class favVideos extends StatelessWidget {
  final String thumbnail;
  final String link;
  const favVideos({
    Key? key,
    required this.thumbnail,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(link))) {
          await launchUrl(Uri.parse(link));
        } else {
          Fluttertoast.showToast(msg: "link Is Not Working");
        }
        //Fluttertoast.showToast(msg: "msg");
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
            height: 35.w,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: NetworkImageWidget(
                image: thumbnail,
                // assetName: 'assets/myprofile/g6754peimage.png',
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 3,
                        offset: const Offset(5, 5)),
                    //const BoxShadow(offset: Offset(0, 0)),
                  ]),
              height: 13.w,
              width: 50.w,
              child: TextWidget(text: "Fundamentals")),
        ],
      ),
    );
  }
}
