// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../../imageUrl/imageurl.dart';
import '../../NewUI/NewBottomNavBar.dart';
import '../../NewUI/NewPage.dart';

class ReferandEarn extends StatelessWidget {
  const ReferandEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 2),
        drawer: const NewPage(),
        body: Column(
          children: [
            Stack(
              children: [
                const ImageWidget(assetName: 'assets/Refer/BlueBg.png'),
                const ImageWidget(assetName: 'assets/Refer/ReferImage.png'),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                              height: 10.w,
                              width: 10.w,
                              //margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  //color: Colors.blue.shade300,
                                  borderRadius: BorderRadius.circular(13)),
                              child: Image.asset(
                                  "assets/images/Asset 6@4x copy.png")),
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
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width - 20.w,
                    child: const ImageWidget(
                        assetName: 'assets/Refer/BgLine.png')),
                Positioned(
                  top: 5.w,
                  left: 10.w,
                  child: Row(
                    children: [
                      SizedBox(
                          width: 50.w,
                          child: const ImageWidget(
                              assetName: 'assets/Refer/greyCode.png')),
                      GestureDetector(
                        onTap: () async {
                          await Share.share(
                            ' Refer code : 123456  check out my website https://skilldren.com',
                          );
                        },
                        child: SizedBox(
                            width: 10.w,
                            child: const ImageWidget(
                                assetName: 'assets/Refer/ShareButton.png')),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: 15.w,
                    top: 7.w,
                    child: TextWidget(
                      text: "123456",
                      fontWeight: FontWeight.bold,
                      textSize: 15.sp,
                    )),
                Positioned(
                    right: 23.w,
                    top: 7.w,
                    child: GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(
                              const ClipboardData(text: "123456"));
                          Fluttertoast.showToast(msg: 'Copied');
                        },
                        child: const Icon(Icons.copy))),
                Positioned(
                    left: 35.w,
                    bottom: 15.w,
                    child: const ImageWidget(assetName: 'assets/Refer/OR.png')),
                Positioned(
                    left: 15.w,
                    bottom: 5.w,
                    child: GestureDetector(
                      onTap: () async {
                        await Share.share(
                          ' Refer code : 123456  check out my website https://skilldren.com',
                        );
                      },
                      child: SizedBox(
                        width: 50.w,
                        child: const ImageWidget(
                            assetName: 'assets/Refer/WhatsAppButton.png'),
                      ),
                    )),
              ],
            ),
          ],
        ));
  }
}
