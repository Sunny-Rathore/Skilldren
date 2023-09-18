// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/utils/color_utils.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/NewUI/StackRow.dart';
import 'package:skilldren/views/NewUI/chapter_page.dart';
import 'package:skilldren/views/NewUI/sub_chapter_page.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../Provider/getAllChapterProvider/getallchapterprovider.dart';
import 'RedAppBar.dart';

class TopicPage extends StatefulWidget {
  final String levle;
  final String chapterName;
  final String chapterId;
  final String cId;
  final String cName;
  const TopicPage(
      {Key? key,
      required this.cId,
      required this.cName,
      required this.levle,
      required this.chapterName,
      required this.chapterId})
      : super(key: key);

  @override
  State<TopicPage> createState() => _Phase1State();
}

class _Phase1State extends State<TopicPage> {
  TextEditingController scontroller = TextEditingController();

  String search = '';
  @override
  Widget build(BuildContext context) {
    final getallchapertProvider =
        Provider.of<GetAllChapterProvider>(context, listen: false);
    // final getAllTopicProvider =
    //     Provider.of<GetAllTopicProvider>(context, listen: false);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 8.h),
          child: RedAppBar(
            tittle: widget.cName,
          ),
        ),
        bottomNavigationBar: const NewBottomnavbar(
          selectedIndex: 0,
        ),
        drawer: const NewPage(),
        floatingActionButton: const FlotingButton(),
        body: FutureBuilder(
          future: getallchapertProvider.getAllchapterResponse(
              cid: widget.cId, level: widget.levle
              //widget.levle
              ),
          // getAllTopicProvider.getAllTopicResponse(widget.cId),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // RedAppBar(
                  //   tittle: widget.cName,
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Indicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  TitleRow(
                      text1: "${widget.levle} >> ",
                      text2: "",
                      text3: widget.chapterName),
                  const SizedBox(
                    height: 20,
                  ),
                  // search(),
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
                                    image: AssetImage(
                                        'assets/images/SearchBg.png'))),
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
                        catName: widget.cName,
                        level: widget.levle,
                        leveColor: Colors.black,
                        chapterName: ">>" + widget.chapterName,
                      ),
                      SizedBox(
                        width: 2.w,
                      )
                    ],
                  ),

                  // const SearchBar(),

                  const SizedBox(
                    height: 20,
                  ),

                  snapshot.connectionState == ConnectionState.waiting
                      ? const CircularProgressIndicator()
                      : getallchapertProvider.mydata.response == null
                          ? TextWidget(
                              text: getallchapertProvider.mydata.errormessage
                                  .toString())
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: getallchapertProvider
                                      .mydata?.response?.length ??
                                  0,
                              itemBuilder: ((context, index) {
                                late String filter = getallchapertProvider
                                    .mydata.response[index].chapterName
                                    .toString(); //! required
                                if (scontroller.text.isEmpty) {
                                  return StackRow(
                                      show: false,
                                      bgImage: "assets/images/p1.png",
                                      bgImage1: "assets/images/p.1.1.png",
                                      cIamge: 'assets/images/Asset32@4x.png',
                                      c2Iamge: getallchapertProvider
                                          .mydata.response[index].chapterIcon,
                                      tText: getallchapertProvider
                                          .mydata.response[index].chapterName
                                          .toString()
                                          .capitalize(),
                                      subText: "",
                                      atext: "Activites:",
                                      RText: "17",
                                      BText: "/31",
                                      xpText: "XP Earned:",
                                      countText: "(35)",
                                      ontap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    SubChapterPage(
                                                        chapterId:
                                                            widget.chapterId,
                                                        chaptername:
                                                            getallchapertProvider
                                                                .mydata
                                                                .response[index]
                                                                .chapterName, //? required

                                                        levle: widget.levle,
                                                        topicName:
                                                            widget.chapterName,
                                                        catname:
                                                            widget.cName)));
                                      });
                                } else if (filter.toLowerCase().startsWith(
                                    scontroller.text.toLowerCase())) {
                                  return StackRow(
                                      show: false,
                                      bgImage: "assets/images/p1.png",
                                      bgImage1: "assets/images/p.1.1.png",
                                      cIamge: 'assets/images/Asset32@4x.png',
                                      c2Iamge: 'assets/images/g1346a.png',
                                      tText: filter,
                                      subText: "",
                                      atext: "Activites:",
                                      RText: "17",
                                      BText: "/31",
                                      xpText: "XP Earned:",
                                      countText: "(35)",
                                      ontap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    SubChapterPage(
                                                        chapterId:
                                                            widget.chapterId,
                                                        chaptername:
                                                            getallchapertProvider
                                                                .mydata
                                                                .response[index]
                                                                .chapterName,
                                                        levle: widget.levle,
                                                        topicName:
                                                            widget.chapterName,
                                                        catname:
                                                            widget.cName)));
                                      });
                                }
                                return Container();
                              }))
                ],
              ),
            );
          }),
        ));
  }
}

class FlotingButton extends StatelessWidget {
  const FlotingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop(true);
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/myprofile/NewBackButtonIcon.png')),
          ),
          height: 12.w,
          width: 12.w,
        ));
  }
}

class TitleRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  const TitleRow({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 20.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/tittlebarImage.png"))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: text1,
                  textSize: 12.sp,
                ),
                Text(
                  text2,
                  style: TextStyle(fontSize: 12.sp),
                ),
                TextWidget(
                  text: text3,
                  fontWeight: FontWeight.w900,
                  color: ColorUtils.text1,
                  textSize: 10.sp,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
