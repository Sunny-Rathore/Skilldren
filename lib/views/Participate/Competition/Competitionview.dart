// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/All%20Competion/all.competition_provider.dart';
import 'package:skilldren/views/Participate/Competition/Competitionunsucribe.dart';

import '../../pages/Widgets/Imagewidget.dart';
import '../../pages/Widgets/TextWidget.dart';

class CompetitionView extends StatefulWidget {
  const CompetitionView({
    Key? key,
  }) : super(key: key);

  @override
  State<CompetitionView> createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  int myindex = 0;
  int nextindex = 0;

  getindex() {
    setState(() {
      myindex = 0;
      if (myindex == 0) {
        Navigator.of(context).pop(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final competitionProvider =
        Provider.of<GetAllCompetionProvier>(context, listen: false);
    return FutureBuilder(
        future: competitionProvider.fetchAPI(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: TextWidget(text: snapshot.error.toString()),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: WillPopScope(
              onWillPop: () => Future.value(getindex()),
              child: IndexedStack(
                index: myindex,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: competitionProvider.mydata.response.length,
                      itemBuilder: ((context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  myindex = myindex + 1;
                                  nextindex = index;
                                });
                              },
                              child: const ImageWidget(
                                  assetName:
                                      'assets/Participate/competetionimage.png'),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  myindex = myindex + 1;
                                  nextindex = index;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        // bottomLeft: Radius.circular(10),
                                        // bottomRight: Radius.circular(10),
                                      ),
                                      child: Image(
                                          fit: BoxFit.fill,
                                          height: 49.w,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          image: NetworkImage(
                                              competitionProvider.mydata
                                                  .response[index].cBanner))

                                      // ImageWidget(
                                      //     assetName:
                                      //         'assets/images/thumnail.jpg')
                                      )),
                            ),
                            Positioned(
                                bottom: 6.w,
                                left: 7.w,
                                child: TextWidget(
                                  text: competitionProvider
                                      .mydata.response[index].cTitle,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  textSize: 20.sp,
                                )),
                          ],
                        );
                      })),
                  CompetitionUnsuscribe(
                    bannerimage:
                        competitionProvider.mydata.response[nextindex].cBanner,
                    title:
                        competitionProvider.mydata.response[nextindex].cTitle,
                    desc: competitionProvider
                        .mydata.response[nextindex].cDescription,
                  )
                ],
              ),
            ),
          );
        }));
  }
}
