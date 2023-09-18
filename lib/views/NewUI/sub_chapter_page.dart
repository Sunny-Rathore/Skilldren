// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Sub%20Chapter/sub_chapter_proivder.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/NewUI/RedAppBar.dart';
import 'package:skilldren/views/NewUI/chapter_page.dart';
import 'package:skilldren/views/NewUI/topic_page.dart';
import 'package:skilldren/views/pages/SkectingPacticePage.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../widgets/cliper.dart';
import '../pages/T1notsubmited.dart';

class SubChapterPage extends StatefulWidget {
  final String catname;
  final String levle;
  final String topicName;
  final String chaptername;
  final String chapterId;
  const SubChapterPage(
      {Key? key,
      required this.catname,
      required this.levle,
      required this.topicName,
      required this.chaptername,
      required this.chapterId})
      : super(key: key);

  @override
  State<SubChapterPage> createState() => _ColoringBasicsPAgeState();
}

class _ColoringBasicsPAgeState extends State<SubChapterPage> {
  int index = 0;
  String? error;
  TextEditingController scontroller = TextEditingController();
  String search = '';
  int listlenght = 0;
  @override
  Widget build(BuildContext context) {
    final subchapterP = Provider.of<SubChapterProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 8.h),
        child: RedAppBar(
          tittle: widget.catname,
        ),
      ),
      bottomNavigationBar: const NewBottomnavbar(
        selectedIndex: 0,
      ),
      drawer: const NewPage(),
      backgroundColor: Colors.white,
      floatingActionButton: const FlotingButton(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Indicator(),
          const SizedBox(
            height: 10,
          ),
          TitleRow(
            text1: "${widget.levle}>>",
            text2: widget.topicName.toString(),
            text3: "${widget.chaptername} >>",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                        height: 12.w,
                        width: 65.w,
                        child: const Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/SearchBg.png'))),
                    SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12.w,
                          ),
                          SizedBox(
                            height: 12.w,
                            width: 53.w,
                            child: TextFormField(
                              cursorHeight: 6.w,
                              controller: scontroller,
                              onChanged: (val) {
                                setState(() {
                                  search = val.toString();
                                });
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "SEARCH",
                                hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff368a99)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              FiltterBox(
                size: 10.sp,
                catName: widget.catname,
                level: widget.levle,
                chapterName: '>>' + widget.chaptername,
                topicName: '>>' + widget.topicName,
                chapterColor: Colors.black,
                leveColor: Colors.black,
              ),
              SizedBox(
                width: 2.w,
              )
            ],
          ),
          FutureBuilder(
            future: subchapterP.fechApi(widget.chapterId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              error = subchapterP.mydata.errormsg;

              return SizedBox(
                child: IndexedStack(index: index, children: [
                  subchapterP.mydata.errormsg != null
                      ? Column(
                          children: [
                            SizedBox(
                              height: 50.w,
                            ),
                            Center(
                              child: TextWidget(
                                  text: subchapterP.mydata.errormsg.toString()),
                            ),
                            SizedBox(
                              height: 50.w,
                            ),
                          ],
                        )
                      : girdboxes(subchapterP, context),
                  Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                      ),
                      const Center(child: Text("NO DATA")),
                    ],
                  )
                ]),
              );
            },
          ),
          SizedBox(
            height: 10.w,
          ),
          Center(
            child: Stack(
              children: [
                SizedBox(
                  width: 50.w,
                  child:
                      const ImageWidget(assetName: 'assets/images/PageBg.png'),
                ),
                Positioned(
                    top: 1.5.w,
                    left: 2.w,
                    child: GestureDetector(
                      onTap: () {
                        if (index > 0) {
                          setState(() {
                            index--;
                          });
                        }
                      },
                      child: SizedBox(
                          width: 3.w,
                          child: const ImageWidget(
                              assetName: 'assets/images/Left.png')),
                    )),
                Positioned(
                    top: 1.5.w,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () {
                        if (index < 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                      child: SizedBox(
                          width: 3.w,
                          child: const ImageWidget(
                              assetName: 'assets/images/Right.png')),
                    )),
                Positioned(
                  left: 18.w,
                  top: 0.2.w,
                  child: TextWidget(
                    text: "Page ${index + 1}/2",
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold,
                    textSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
        ],
      ),
    );
  }

  Column girdboxes(
    SubChapterProvider subchapterP,
    BuildContext context,
  ) {
    return Column(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          childAspectRatio: 1,
          crossAxisCount: 2,
          children:
              List.generate(subchapterP.mydata?.response?.length ?? 0, (index) {
            String filtter = subchapterP.mydata.response[index].subChapterName;
            if (scontroller.text.isEmpty) {
              // print(
              //     "length: ${subchapterP.mydata?.response?.length}");
              // print(listlenght);
              listlenght = subchapterP.mydata?.response?.length ?? 0;
              // print(listlenght);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => T1NotSubmited(
                            subchapterId:
                                subchapterP.mydata.response[index].subChapterId,
                            index: index,
                            thumbnail: subchapterP.mydata.response[index]
                                .subChapterVideoThumbnail,
                            subchapter: subchapterP
                                .mydata.response[index].subChapterName,
                            des: subchapterP
                                .mydata.response[index].subChapterDescription,
                            videoslink: subchapterP
                                .mydata.response[index].subChapterVideoLink,
                          )));
                },
                child: ColorBasicsBox(
                  subChapterXpPoint:
                      subchapterP.mydata.response[index].subChapterXpPoint,
                  index: index,
                  tutorialText:
                      subchapterP.mydata.response[index].subChapterName,
                  qtext: subchapterP.mydata.response[index].subChapterSubTitle,
                  imageUrl: subchapterP
                      .mydata.response[index].subChapterVideoThumbnail,
                  xpImage: "assets/images/XpRed.png",
                ),
              );
            } else if (filtter
                .toLowerCase()
                .startsWith(scontroller.text.toLowerCase())) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => T1NotSubmited(
                            subchapterId:
                                subchapterP.mydata.response[index].subChapterId,
                            index: index,
                            thumbnail: subchapterP.mydata.response[index]
                                .subChapterVideoThumbnail,
                            subchapter: subchapterP
                                .mydata.response[index].subChapterName,
                            des: subchapterP
                                .mydata.response[index].subChapterDescription,
                            videoslink: subchapterP
                                .mydata.response[index].subChapterVideoLink,
                          )));
                },
                child: ColorBasicsBox(
                  index: index,
                  tutorialText: filtter,
                  //  subchapterP
                  //     .mydata.response[index].subChapterName,
                  qtext: "",
                  imageUrl: subchapterP
                      .mydata.response[index].subChapterVideoThumbnail,
                  // subChapterVideoThumbnail   'assets/images/g1020.png',
                  xpImage: "assets/images/XpRed.png",
                  subChapterXpPoint:
                      subchapterP.mydata.response[index].subChapterXpPoint,
                ),
              );
            }
            return Container();
          }),
        ),
        Align(
            alignment: listlenght.isEven
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: PdfBooklet(
              pdfLink: subchapterP.mydata.response[index].chapterPdfFile,
              title: subchapterP.mydata.response[index].chapterName,
              subtitle: subchapterP.mydata.response[index].chapterSubTitle,
            ))
      ],
    );
  }
}

class PdfBooklet extends StatelessWidget {
  final String title;
  final String subtitle;

  final String pdfLink;
  const PdfBooklet(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.pdfLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SkechingPractice(
                      pdfLink: pdfLink,
                      title: title,
                      subtitle: subtitle,
                    )));
          },
          child: SizedBox(
              width: 50.w,
              child:
                  const ImageWidget(assetName: "assets/images/path574.png"))),
      Positioned(
        top: 30.w,
        child: FittedBox(
          child: TextWidget(
              text: title.toString().capitalize(),
              textSize: title.length > 20 ? 10.sp : 12.sp,
              color: ColorUtils.text1,
              fontWeight: FontWeight.bold),
        ),
      ),
      Positioned(
          top: 36.w,
          left: 5.w,
          child: SizedBox(
            width: 38.w,
            child: Text(
              subtitle,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 8.sp,
                  color: ColorUtils.text1,
                  fontWeight: FontWeight.bold),
            ),
          )),
    ]);
  }
}

class ColorBasicsBox extends StatelessWidget {
  final String subChapterXpPoint;
  final String tutorialText;
  final String? qtext;
  final int index;

  final String imageUrl;
  final String xpImage;

  const ColorBasicsBox({
    Key? key,
    required this.imageUrl,
    required this.xpImage,
    required this.tutorialText,
    required this.qtext,
    required this.index,
    required this.subChapterXpPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 50.w,
          child: ImageWidget(
              assetName: index == 0
                  ? 'assets/images/BoxBg.png'
                  : index == 1
                      ? 'assets/images/BoxBgGreen.png'
                      : 'assets/images/BoxBgYellow.png'),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 2.w,
              top: 5.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: RPSCustomPainter(),
                    child: Container(
                        height: 28.5.w, width: 45.5.w, color: ColorUtils.text1),
                  ),
                  SizedBox(
                      height: 28.w,
                      width: 45.w,
                      child: ClipPath(
                          clipper: RPSCustomPainter(),
                          child: Hero(
                              tag: 'image$index',
                              child: NetworkImageWidget(image: imageUrl)))),
                ],
              ),
            ),
            Positioned(
              top: 32.w,
              child: FittedBox(
                child: TextWidget(
                    text: tutorialText.toString().capitalize(),
                    textSize: tutorialText.length > 20 ? 10.sp : 12.sp,
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 37.w,
              child: FittedBox(
                child: TextWidget(
                    text: qtext ?? '',
                    textSize: 7.sp,
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 0.5.w,
              left: 26.w,
              child: FittedBox(
                child: TextWidget(
                    text: subChapterXpPoint,
                    textSize: 10.sp,
                    color: ColorUtils.text1,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
