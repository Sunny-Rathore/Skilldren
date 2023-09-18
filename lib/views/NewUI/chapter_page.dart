// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/GetAllTopic/get_all_topic_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/NewUI/Indicator.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';
import 'package:skilldren/views/NewUI/NewPage.dart';
import 'package:skilldren/views/NewUI/RedAppBar.dart';
import 'package:skilldren/views/NewUI/topic_page.dart';
import 'package:skilldren/views/pages/Widgets/Imagewidget.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

import '../../utils/color_utils.dart';
import 'StackRow.dart';

class ChapterPage extends StatefulWidget {
  final String cid;
  final String catname;

  const ChapterPage({Key? key, required this.cid, required this.catname})
      : super(key: key);

  @override
  State<ChapterPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ChapterPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController scontroller = TextEditingController();
  String search = '';
  int index = 0;
  // bool i = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {
        index = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          // RedAppBar(
          //   tittle: widget.catname,
          // ),
          const SizedBox(
            height: 30,
          ),
          const Indicator(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10.w,
            child: TabBar(
                controller: tabController,
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                labelPadding: const EdgeInsets.only(top: 5),
                automaticIndicatorColorAdjustment: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                    image: DecorationImage(
                        //fit: BoxFit.fill,
                        image: AssetImage("assets/images/Asset 51 .png"))),
                //indicatorColor: Colors.white,
                tabs: [
                  TextWidget(
                      text: "Beginner",
                      color: index == 1 ? Colors.grey : Colors.black),
                  TextWidget(
                      text: 'Intermediate',
                      color: index == 0 ? Colors.grey : Colors.black),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextWidget(
              text:
                  "For Children Who are new the world of art of those who are looking to  masters the basics for the higher level preprations",
              textSize: 9.sp,
            ),
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
                catName: widget.catname,
                level: index == 0 ? 'Beginner' : 'Intermediate',
              ),
              SizedBox(
                width: 2.w,
              )
            ],
          ),

          // const SearchBar(),
          Expanded(
            // height: 200,
            //width: MediaQuery.of(context).size.width,
            child: TabBarView(controller: tabController, children: [
              TAb1(
                controller: scontroller,
                search: search,
                catname: widget.catname,
                cid: widget.cid,
              ),
              Tab2(
                search: search,
                catname: widget.catname,
                cid: widget.cid,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class FiltterBox extends StatelessWidget {
  const FiltterBox({
    Key? key,
    required this.catName,
    required this.level,
    this.chapterName,
    this.topicName,
    this.leveColor,
    this.chapterColor,
    this.topicColor,
    this.size,
  }) : super(key: key);

  final String catName;
  final String level;
  final String? chapterName;
  final String? topicName;
  final Color? leveColor;
  final Color? chapterColor;
  final Color? topicColor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              constraints: BoxConstraints(maxHeight: 150.w),
              context: context,
              builder: (context) => Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffe6e7e8),
                        border: Border(top: BorderSide(width: 5))),
                    child: ListView(
                      padding: EdgeInsets.all(5.w),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextWidget(
                                    textSize: size ?? 15.sp,
                                    text: catName + ' >>'),
                                TextWidget(
                                  textSize: size ?? 15.sp,
                                  text: level,
                                  color: leveColor ?? const Color(0xff23677c),
                                ),
                                TextWidget(
                                    textSize: size ?? 15.sp,
                                    text: chapterName ?? '',
                                    color: chapterColor ??
                                        const Color(0xff23677c)),
                                TextWidget(
                                  textSize: size ?? 15.sp,
                                  text: topicName ?? '',
                                  color: topicColor ?? const Color(0xff23677c),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: SizedBox(
                                width: 12.w,
                                height: 12.w,
                                child: const ImageWidget(
                                    assetName:
                                        'assets/images/FillterCancel.png'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Center(
                          child: TextWidget(
                            text: 'Filter By',
                            color: ColorUtils.text1,
                            fontfamily: grandstander,
                            fontWeight: FontWeight.bold,
                            textSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Activity Status',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                const MyCheckBoxTile(
                                  title: 'Activity Pending',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Activity Completed',
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                TextWidget(
                                  text: 'Search In',
                                  fontWeight: FontWeight.bold,
                                ),
                                const MyCheckBoxTile(
                                  title: 'Phase1 (Basic)',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Phase2 (Easy)',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Phase3 (Medium)',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Phase4 (Hard)',
                                ),
                                SizedBox(
                                  height: 5.w,
                                ),
                                TextWidget(
                                  text: 'Sort By',
                                  fontWeight: FontWeight.bold,
                                ),
                                const MyCheckBoxTile(
                                  title: 'Recent First',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Colors:',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                const MyCheckBoxTile(
                                  title: 'Crayons',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Sketch Pens',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Black & White',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Oil Pastels',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Pencil Colors',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Acrylic Paint',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Poster Colors',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Water Colors',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Categories',
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                const MyCheckBoxTile(
                                  title: 'Basics',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Flowers & Leaves',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Animal Kingdom',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Fantsy World',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Science Fiction',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Portraits',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Landscapes',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Vehicles',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Festivals',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Cartoons',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Abstract',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Creative Corner',
                                ),
                                const MyCheckBoxTile(
                                  title: 'Miscellaneous',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.w,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 20.w,
                              child: const ImageWidget(
                                  assetName:
                                      'assets/images/howtouseWithout.png'),
                            ),
                            Positioned(
                              top: 5.w,
                              left: 28.w,
                              child: TextWidget(
                                text: 'How To Use Filters?',
                                color: const Color(0xff0e3f6b),
                                textSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
        },
        child: const SizedBox(
          height: 30,
          // width: 40,
          child: Image(
              image: AssetImage(
            "assets/images/Asset33@4x.png",
          )),
        ),
      ),
    );
  }
}

class MyCheckBoxTile extends StatefulWidget {
  final String title;
  final bool? ckeak;
  const MyCheckBoxTile({
    Key? key,
    required this.title,
    this.ckeak,
  }) : super(key: key);

  @override
  State<MyCheckBoxTile> createState() => _MyCheckBoxTileState();
}

class _MyCheckBoxTileState extends State<MyCheckBoxTile> {
  bool isCheak = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 2.w,
            width: 2.w,
            child: Checkbox(
                activeColor: const Color(0xff23677c),
                focusColor: const Color(0xff23677c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.5.sp)),
                value: isCheak,
                // tristate: true,
                onChanged: (val) {
                  setState(() {
                    isCheak = val!;
                  });
                })),
        SizedBox(
          width: 3.w,
        ),
        TextWidget(
            fontWeight: FontWeight.bold,
            text: widget.title,
            textSize: 10.sp,
            color: const Color(0xff23677c))
      ],
    );
  }
}

class TAb1 extends StatefulWidget {
  final TextEditingController controller;
  final String search;
  final String cid;
  final String catname;

  const TAb1(
      {Key? key,
      required this.cid,
      required this.catname,
      required this.search,
      required this.controller})
      : super(key: key);

  @override
  State<TAb1> createState() => _TAb1State();
}

class _TAb1State extends State<TAb1> {
  @override
  void initState() {
    super.initState();
    // getAllchapterResponse();
  }

  @override
  Widget build(BuildContext context) {
    // final getallchapertProvider =
    //     Provider.of<GetAllChapterProvider>(context, listen: false);
    final getallTopicProvider =
        Provider.of<GetAllTopicProvider>(context, listen: false);
    return SingleChildScrollView(
        child: FutureBuilder(
      future: getallTopicProvider.getAllTopicResponse(widget.cid),
      // getallchapertProvider.getAllchapterResponse(
      //     cid: widget.cid, level: "beginner"),
      builder: ((context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const SizedBox(
                height: 30,
                width: 30,
                child: Center(child: CircularProgressIndicator()))
            : getallTopicProvider.mydata.response == null
                ? Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        TextWidget(
                            text:
                                getallTopicProvider.mydata.errormsg.toString()),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        getallTopicProvider.mydata?.response?.length ?? 0,
                    // getallchapertProvider.mydata?.response?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      String filtter = getallTopicProvider
                          .mydata.response[index].topicName
                          .toString();
                      if (widget.search.isEmpty) {
                        return StackRow(
                            show: true,
                            bgImage: "assets/images/p1.png",
                            bgImage1: "assets/images/p.1.1.png",
                            cIamge: 'assets/images/Asset32@4x.png',
                            c2Iamge: getallTopicProvider
                                .mydata.response[index].topicIcon,
                            //  getallchapertProvider
                            //     .mydata.response[index].chapterIcon,

                            // 'assets/images/g1346a.png',
                            tText: getallTopicProvider
                                .mydata.response[index].topicName
                                .toString()
                                .capitalize(),
                            // "Phase 1",
                            // tText: getallchapertProvider
                            //     .mydata.response[index].chapterName
                            //     .toString()
                            //     .capitalize(),
                            // "Phase 1",
                            subText: " Building the Basics",
                            atext: "Activites:",
                            RText: "17",
                            BText: "/31",
                            xpText: "XP Earned:",
                            countText: "(35)",
                            ontap: () async {
                              // print("object");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TopicPage(
                                        chapterId: getallTopicProvider
                                                .mydata?.response?[index].tid
                                                .toString() ??
                                            '',
                                        levle: 'beginner',
                                        chapterName: getallTopicProvider
                                            .mydata.response[index].topicName
                                            .toString(),
                                        cName: widget.catname,
                                        cId: widget.cid,
                                      )));
                            });
                      } else if (filtter
                          .toLowerCase()
                          .startsWith(widget.search.toLowerCase())) {
                        return StackRow(
                            show: true,
                            bgImage: "assets/images/p1.png",
                            bgImage1: "assets/images/p.1.1.png",
                            cIamge: 'assets/images/Asset32@4x.png',
                            c2Iamge: 'assets/images/g1346a.png',
                            tText: filtter,
                            // "Phase 1",
                            subText: " Building the Basics",
                            atext: "Activites:",
                            RText: "17",
                            BText: "/31",
                            xpText: "XP Earned:",
                            countText: "(35)",
                            ontap: () async {
                              // print("object");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TopicPage(
                                        chapterId: getallTopicProvider
                                            .mydata.response[index].tid
                                            .toString(),
                                        levle: 'beginner',
                                        chapterName: getallTopicProvider
                                            .mydata.response[index].topicName
                                            .toString(),
                                        cName: widget.catname,
                                        cId: widget.cid,
                                      )));
                            });
                      }
                      return Container();
                    }));
      }),
    ));
  }
}

class Tab2 extends StatelessWidget {
  final String search;
  final String cid;
  final String catname;

  const Tab2(
      {Key? key,
      required this.cid,
      required this.catname,
      required this.search})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getallTopicProvider =
        Provider.of<GetAllTopicProvider>(context, listen: false);
    return SingleChildScrollView(
        child: FutureBuilder(
      future: getallTopicProvider.getAllTopicResponse(cid),
      builder: ((context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const SizedBox(
                height: 30,
                width: 30,
                child: Center(child: CircularProgressIndicator()))
            : getallTopicProvider.mydata.response == null
                ? Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        TextWidget(
                            text:
                                getallTopicProvider.mydata.errormsg.toString()),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        getallTopicProvider.mydata?.response?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      String filtter = getallTopicProvider
                          .mydata.response[index].topicName
                          .toString();
                      if (search.isEmpty) {
                        return StackRow(
                            show: true,
                            bgImage: "assets/images/p1.png",
                            bgImage1: "assets/images/p.1.1.png",
                            cIamge: 'assets/images/Asset32@4x.png',
                            c2Iamge: 'assets/images/g1346a.png',
                            tText: getallTopicProvider
                                .mydata.response[index].topicName
                                .toString()
                                .capitalize(),
                            // "Phase 1",
                            subText: " Building the Basics",
                            atext: "Activites:",
                            RText: "17",
                            BText: "/31",
                            xpText: "XP Earned:",
                            countText: "(35)",
                            ontap: () async {
                              // print("object");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TopicPage(
                                        chapterId: getallTopicProvider
                                            .mydata.response[index].tid
                                            .toString(),
                                        levle: 'Intermediate',
                                        chapterName: getallTopicProvider
                                            .mydata.response[index].topicName
                                            .toString(),
                                        cName: catname,
                                        cId: cid,
                                      )));
                            });
                      } else if (filtter
                          .toLowerCase()
                          .startsWith(search.toLowerCase().toString())) {
                        return StackRow(
                            show: true,
                            bgImage: "assets/images/p1.png",
                            bgImage1: "assets/images/p.1.1.png",
                            cIamge: 'assets/images/Asset32@4x.png',
                            c2Iamge: 'assets/images/g1346a.png',
                            tText: filtter,
                            // "Phase 1",
                            subText: " Building the Basics",
                            atext: "Activites:",
                            RText: "17",
                            BText: "/31",
                            xpText: "XP Earned:",
                            countText: "(35)",
                            ontap: () async {
                              // print("object");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TopicPage(
                                        chapterId: getallTopicProvider
                                            .mydata.response[index].tid
                                            .toString(),
                                        levle: 'Intermediate',
                                        chapterName: getallTopicProvider
                                            .mydata.response[index].topicName
                                            .toString(),
                                        cName: catname,
                                        cId: cid,
                                      )));
                            });
                      }
                      return Container();
                    }));
      }),
    ));
  }
}



 // Column(
        //   children: [
        //     // ListView.builder(
        //     //     shrinkWrap: true,
        //     //     itemBuilder: ((context, index) {
        //     //       return StackRow(
        //     //           show: true,
        //     //           bgImage: "assets/images/p1.png",
        //     //           bgImage1: "assets/images/p.1.1.png",
        //     //           cIamge: 'assets/images/Asset32@4x.png',
        //     //           c2Iamge: 'assets/images/g1346a.png',
        //     //           tText: "Phase 1",
        //     //           subText: " Building the Basics",
        //     //           atext: "Activites:",
        //     //           RText: "17",
        //     //           BText: "/31",
        //     //           xpText: "XP Earned:",
        //     //           countText: "(35)",
        //     //           ontap: () async {
        //     //             // print("object");
        //     //             Navigator.of(context).push(MaterialPageRoute(
        //     //                 builder: (context) => const Phase1()));
        //     //           });
        //     //     })),
        //     StackRow(
        //         show: true,
        //         bgImage: "assets/images/p1.png",
        //         bgImage1: "assets/images/p.1.1.png",
        //         cIamge: 'assets/images/Asset32@4x.png',
        //         c2Iamge: 'assets/images/g1346a.png',
        //         tText: "Phase 1",
        //         subText: " Building the Basics",
        //         atext: "Activites:",
        //         RText: "17",
        //         BText: "/31",
        //         xpText: "XP Earned:",
        //         countText: "(35)",
        //         ontap: () async {
        //           // print("object");
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => const Phase1()));
        //         }),
        //     StackRow(
        //         show: true,
        //         bgImage: "assets/images/p2.png",
        //         bgImage1: "assets/images/p.1.1.png",
        //         cIamge: 'assets/images/Asset30@4x.png',
        //         c2Iamge: 'assets/images/g1756BirdB.png',
        //         tText: "Phase 2",
        //         subText: "Slow 'N' Steady We Progress",
        //         atext: "Activites:",
        //         RText: "17",
        //         BText: "/31",
        //         xpText: "XP Earned:",
        //         countText: "(35)",
        //         ontap: () {
        //           // Navigator.of(context).push(MaterialPageRoute(
        //           //     builder: (context) => const ColoringBasicsPAge()));
        //         }),
        //     StackRow(
        //         show: true,
        //         bgImage: "assets/images/p3.png",
        //         bgImage1: "assets/images/p3.1.png",
        //         cIamge: 'assets/images/Asset28@4x.png',
        //         c2Iamge: 'assets/images/g1762rose.png',
        //         tText: " Phase 3",
        //         subText: " Taking Challanges",
        //         atext: "Activites:",
        //         RText: "17",
        //         BText: "/31",
        //         xpText: "XP Earned:",
        //         countText: "(35)",
        //         ontap: () {}),
        //     StackRow(
        //         show: true,
        //         bgImage: "assets/images/p4.png",
        //         bgImage1: "assets/images/p4.1.png",
        //         cIamge: 'assets/images/Asset27@4x.png',
        //         c2Iamge: "assets/images/g1772home.png",
        //         tText: "Pahse 4",
        //         subText: " Eying the Next Leve;",
        //         atext: "Activites:",
        //         RText: "17",
        //         BText: "/31",
        //         xpText: "XP Earned:",
        //         countText: "(35)",
        //         ontap: () {}),
        //   ],
        // );
