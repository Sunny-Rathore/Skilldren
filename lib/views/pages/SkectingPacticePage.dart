// ignore_for_file: file_names, unused_local_variable

import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../imageUrl/imageurl.dart';
import '../../utils/color_utils.dart';
import '../../utils/string_utils.dart';
import '../../widgets/cliper.dart';
import '../NewUI/Indicator.dart';
import '../NewUI/NewPage.dart';
import 'Widgets/Imagewidget.dart';

class SkechingPractice extends StatefulWidget {
  final String title;
  final String subtitle;
  final String pdfLink;

  const SkechingPractice({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.pdfLink,
  }) : super(key: key);

  @override
  State<SkechingPractice> createState() => _SkechingPracticeState();
}

class _SkechingPracticeState extends State<SkechingPractice> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

//FlutterDownloader.registerCallback(downloadCallback); //  ?Unconmmnet it
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  void downloadPdf(String url, fileName) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final externalDir = await getExternalStorageDirectory();
      //final newFilePath = '${externalDir!.path}/certificate';
      final taskId = await FlutterDownloader.enqueue(
          url: url,
          headers: {}, // optional: header send with url (auth token etc)
          savedDir: externalDir!.path,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification: true,
          saveInPublicStorage: true,
          fileName: fileName);
    } else {
      debugPrint("no permition");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NewPage(),
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 50.h),
            child: Builder(builder: (context) {
              return Container(
                alignment: Alignment.center,
                height: 12.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.white])),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w, top: 8.w, right: 0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SizedBox(
                            height: 10.w,
                            width: 10.w,
                            child: const ImageWidget(
                                assetName: 'assets/images/rank1/menuicon.png'),
                          ),
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
              );
            })),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.w),
              const Indicator(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toString().capitalize(),
                      style: const TextStyle(
                          fontFamily: FontFamily.ballobhai2,
                          color: Color(0Xff414042),
                          fontSize: 21.33),
                    ),
                    Text(
                      widget.subtitle.toString().capitalize(),
                      style: TextStyle(
                        fontSize: 24,
                        color: ColorUtils.text1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                            image: AssetImage(
                                'assets/SketchingImages/path194red.bg.png')),
                        Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    'assets/SketchingImages/text708Pdf.png')),
                            Image(
                                image: AssetImage(
                                    'assets/SketchingImages/text712Downlodad.png')),
                          ],
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
                          top: 1.w,
                          left: 35.w,
                          child: GestureDetector(
                            onTap: () {
                              downloadPdf(widget.pdfLink, widget.title);
                            },
                            child: SizedBox(
                              width: 7.w,
                              child: const ImageWidget(
                                  assetName:
                                      'assets/SketchingImages/g670Dowlodabutton.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 7.5.w,
                          left: 32.w,
                          child: TextWidget(
                            text: "Download",
                            textSize: 10.sp,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 1.w,
                          left: 53.w,
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
                          left: 53.w,
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
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Image(
                              image: AssetImage(
                                  'assets/SketchingImages/g252bgPShade.png')),
                          TextWidget(
                              text: "DESCRIPTION",
                              textSize: 14.67,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      text:
                          "This PDF contains all the Excersies you need to completebefore proceeding to the next tutorials. Download the PDFand get a print out.",
                      textSize: 13.33,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        downloadPdf(widget.pdfLink, widget.title);
                      },
                      child: const Center(
                        child: Image(
                            image: AssetImage(
                                'assets/SketchingImages/g670Dowlodabutton.png')),
                      ),
                    ),
                    const Center(
                      child: Image(
                          image: AssetImage(
                              'assets/SketchingImages/text668Download.png')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
