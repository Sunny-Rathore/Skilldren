import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/Get%20All%20Task/get_all_task_provider.dart';
import 'package:skilldren/constant.dart';
import 'package:skilldren/views/Participate/Task/taskpending.dart';

import '../../pages/Widgets/Imagewidget.dart';
import '../../pages/Widgets/TextWidget.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getAllTaskProvider =
        Provider.of<GetAllTaskProvier>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
              child: TextWidget(
                text:
                    "Complete the Daily and Weekly Tasks to Earn XP & a chance to get featured on all the Skilldren Social Media Platforms. Its your chance to become a kid inﬂuencer!",
                textSize: 9.sp,
              ),
            ),

            FutureBuilder(
                future: getAllTaskProvider.fetchAPI(),
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
                  return ListView.builder(
                      itemCount:
                          getAllTaskProvider.mydata?.response?.length ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TaskPending(
                                      tasktype: getAllTaskProvider
                                          .mydata.response[index].taskType,
                                      tid: getAllTaskProvider
                                          .mydata.response[index].taskId,
                                      xp: getAllTaskProvider
                                          .mydata.response[index].taskReward,
                                      image: getAllTaskProvider
                                          .mydata.response[index].taskImage,
                                      time:
                                          "TIME LEFT : ${getAllTaskProvider.mydata.response[index].taskDuration} DAYS",
                                      tittle: getAllTaskProvider
                                          .mydata.response[index].taskTitle
                                          .toString()
                                          .capitalize(),
                                      des: getAllTaskProvider.mydata
                                          .response[index].taskDescription,
                                    )));
                          },
                          child: Stack(
                            children: [
                              ImageWidget(
                                  assetName: getAllTaskProvider.mydata
                                              .response[index].taskType ==
                                          "Remaning"
                                      ? 'assets/Participate/grey.png'
                                      : getAllTaskProvider.mydata
                                                  .response[index].taskType ==
                                              'Under assesment'
                                          ? 'assets/Participate/Blue.png'
                                          : 'assets/Participate/Green.png'),
                              Positioned(
                                  left: 8.w,
                                  top: 2.w,
                                  child: TextWidget(
                                    text: getAllTaskProvider
                                        .mydata.response[index].taskType
                                        .toString()
                                        .toUpperCase(),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    textSize: 10.sp,
                                  )),
                              Positioned(
                                  right: 7.w,
                                  top: 2.5.w,
                                  child: TextWidget(
                                    text:
                                        "TIME LEFT : ${getAllTaskProvider.mydata.response[index].taskDuration} DAYS",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    textSize: 10.sp,
                                  )),
                              Positioned(
                                  left: 5.w,
                                  top: getAllTaskProvider.mydata.response[index]
                                              .taskType ==
                                          "Remaning"
                                      ? 14.5.w
                                      : getAllTaskProvider.mydata
                                                  .response[index].taskType ==
                                              'Under assesment'
                                          ? 14.w
                                          : 15.w,
                                  child: TextWidget(
                                    text: getAllTaskProvider
                                        .mydata.response[index].taskTitle
                                        .toString()
                                        .capitalize(),
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    textSize: 13.sp,
                                  )),
                              Positioned(
                                  right: 5.w,
                                  top: 14.5.w,
                                  child: TextWidget(
                                    text: '+' +
                                        getAllTaskProvider
                                            .mydata.response[index].taskReward
                                            .toString() +
                                        'XP',
                                    color: Colors.white,
                                    textSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        );
                      }));
                })),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const TaskPending()));
            //   },
            //   child: Stack(
            //     children: [
            //       const ImageWidget(assetName: 'assets/Participate/Blue.png'),
            //       Positioned(
            //           left: 5.w,
            //           top: 2.w,
            //           child: TextWidget(
            //             text: "UNDER ASSESSMENT",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           right: 7.w,
            //           top: 3.w,
            //           child: TextWidget(
            //             text: "TIME LEFT : 2D 16H 44M",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           left: 8.w,
            //           top: 15.w,
            //           //(constraints.maxHeight),

            //           child: TextWidget(
            //             text: "3D Paper Plane",
            //             color: Colors.green,
            //             fontWeight: FontWeight.bold,
            //             textSize: 13.sp,
            //           )),
            //       Positioned(
            //           right: 3.w,
            //           top: 15.w,
            //           child: TextWidget(
            //             text: "+25 Xp",
            //             color: Colors.white,
            //             textSize: 14.sp,
            //             fontWeight: FontWeight.bold,
            //           )),
            //     ],
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const TaskCompleted()));
            //   },
            //   child: Stack(
            //     children: [
            //       const ImageWidget(assetName: 'assets/Participate/Green.png'),
            //       Positioned(
            //           left: 5.w,
            //           top: 2.w,
            //           child: TextWidget(
            //             text: "COMPLETED",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           right: 7.w,
            //           top: 3.w,
            //           child: TextWidget(
            //             text: "TIME LEFT : 2D 16H 44M",
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           left: 8.w,
            //           top: 16.w,
            //           child: TextWidget(
            //             text: "Draw a Duck",
            //             color: Colors.green,
            //             fontWeight: FontWeight.bold,
            //             textSize: 13.sp,
            //           )),
            //       Positioned(
            //           right: 3.w,
            //           top: 15.w,
            //           child: TextWidget(
            //             text: "+15 Xp",
            //             color: Colors.white,
            //             textSize: 14.sp,
            //             fontWeight: FontWeight.bold,
            //           )),
            //     ],
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const Taskaincomplete()));
            //   },
            //   child: Stack(
            //     children: [
            //       const ImageWidget(assetName: 'assets/Participate/grey.png'),
            //       Positioned(
            //           left: 7.w,
            //           top: 3.w,
            //           child: TextWidget(
            //             text: "REMAINING",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           right: 7.w,
            //           top: 3.w,
            //           child: TextWidget(
            //             text: "TIME LEFT : 2D 16H 44M",
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             textSize: 10.sp,
            //           )),
            //       Positioned(
            //           left: 8.w,
            //           top: 16.w,
            //           child: TextWidget(
            //             text: "Introduce Yourself",
            //             color: Colors.grey.shade600,
            //             fontWeight: FontWeight.bold,
            //             textSize: 13.sp,
            //           )),
            //       Positioned(
            //           right: 3.w,
            //           top: 15.w,
            //           child: TextWidget(
            //             text: "+15 Xp",
            //             color: Colors.white,
            //             textSize: 14.sp,
            //             fontWeight: FontWeight.bold,
            //           )),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
