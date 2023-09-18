// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:skilldren/videoPage/videoPalyer.dart';
// import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

// import '../../constant.dart';
// import '../NewUI/NewPage.dart';
// import '../../utils/color_utils.dart';
// import '../../utils/string_utils.dart';
// import '../NewUI/Indicator.dart';

// class T1Complete extends StatefulWidget {
//   final String subchapter;
//   final String des;
//   final String videoslink;
//   const T1Complete(
//       {Key? key,
//       required this.subchapter,
//       required this.des,
//       required this.videoslink})
//       : super(key: key);

//   @override
//   State<T1Complete> createState() => _T1CompleteState();
// }

// class _T1CompleteState extends State<T1Complete> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10.5.w,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Builder(builder: (context) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const NewPage()));
//                     },
//                     child: Container(
//                         height: 10.w,
//                         width: 10.w,
//                         // margin: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13)),
//                         child: Image.asset(
//                           "assets/images/Asset 6@4x copy.png",
//                         )),
//                   );
//                 }),
//                 Container(
//                     height: 10.w,
//                     width: 10.w,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage(
//                             "assets/images/Asset 5@4x.png",
//                           )),
//                     ))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 7.w,
//           ),
//           const Indicator(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 5.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.subchapter.toString(),
//                   // "Tutorial 1",
//                   style: const TextStyle(
//                       fontFamily: FontFamily.ballobhai2, fontSize: 21.33),
//                   //style: baloobhai2.copyWith(fontSize: 21.33.sp),
//                 ),
//                 Text(
//                   widget.des.toString(),
//                   //"Introduction To Colors",
//                   style: TextStyle(
//                     fontFamily: FontFamily.ballobhai2,
//                     fontSize: 24,
//                     color: ColorUtils.text1,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.w,
//                 ),
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     const Image(
//                         color: Color(0XFF6D6E71),
//                         image: AssetImage(
//                             'assets/tutorialonepageimage/path298blackbg (1).png')),
//                     const Image(
//                         image: AssetImage(
//                             'assets/tutorialonepageimage/g364w.png')),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) =>
//                                 PlayVideo(src: widget.videoslink)));
//                       },
//                       child: const Image(
//                           image: AssetImage(
//                               'assets/tutorialonepageimage/path370redplay.png')),
//                     ),
//                   ],
//                 ),
//                 const Image(
//                     image: AssetImage(
//                         'assets/tutorialonepageimage/g612bgimagewithicon.png')),
//                 SizedBox(
//                   height: 5.w,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       const Image(
//                           image: AssetImage(
//                               'assets/tutorialonepageimage/g380redwithBg.png')),
//                       Text(
//                         "ACTIVITY",
//                         style: baloobhai.copyWith(
//                             fontSize: 12.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.w,
//                 ),
//                 Stack(
//                   children: [
//                     const Image(
//                         image: AssetImage(
//                             'assets/tutorialonepageimage/g798under revierw.png')),
//                     Positioned(
//                         top: 2.w,
//                         right: 3.w,
//                         child: ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(20)),
//                             child: SizedBox(
//                               height: 24.w,
//                               width: 37.w,
//                               child: const Image(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage('assets/images/g996.png')),
//                             ))),
//                     Positioned(
//                       left: 12.w,
//                       top: 3.5.w,
//                       child: Text(
//                         "Completed",
//                         style: baloobhai.copyWith(
//                             fontSize: 9.sp, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Positioned(
//                       left: 2.w,
//                       top: 9.w,
//                       child: SizedBox(
//                         width: 45.w,
//                         child: TextWidget(
//                           textSize: 10.sp,
//                           text:
//                               "Kudos CHAMP! Well Done.We hope you had a great timeand a new lesson!",
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5.w,
//                 ),
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     const Image(
//                         image: AssetImage(
//                             "assets/tutorialonepageimage/g142border.png")),
//                     const Positioned(
//                       top: -10,
//                       child: Image(
//                           image: AssetImage(
//                               "assets/tutorialonepageimage/g914greenBg.png")),
//                     ),
//                     const Positioned(
//                       top: -5,
//                       left: 30,
//                       child: Text("Teacher’s Remarks :",
//                           style: TextStyle(
//                               fontFamily: FontFamily.ballobhai2,
//                               fontSize: 10.33,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal)),
//                     ),
//                     Positioned(
//                       width: MediaQuery.of(context).size.width - 15.w,
//                       top: 8.w,
//                       left: 3.w,
//                       child: TextWidget(
//                         text:
//                             "Hey Vaibhav,\nYour submission is reviewed and XP is granted!Great job by the way",
//                         color: ColorUtils.text1,
//                         textSize: 10.sp,
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
