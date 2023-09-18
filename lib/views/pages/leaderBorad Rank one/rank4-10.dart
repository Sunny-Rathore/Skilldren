// ignore: duplicate_ignore
// ignore_for_file: file_names
 
// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:skilldren/views/pages/leaderBorad%20Rank%20one/rankoutof10.dart';

// import '../../NewUI/NewBottomNavBar.dart';
// import '../../NewUI/NewPage.dart';
// import '../Widgets/TextWidget.dart';

// class Rank4to10 extends StatelessWidget {
//   const Rank4to10({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             const Image(
//                 // height: MediaQuery.of(context).size.height,
//                 // width: MediaQuery.of(context).size.width,
//                 image: AssetImage('assets/images/rank1/Asset 16@2x.png')),
//             const Image(image: AssetImage('assets/images/rank1/coneimage.png')),
//             Column(
//               children: [
//                 Stack(
//                   children: [
//                     const Image(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/images/rank1/Image 1.png')),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8.w),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => const NewPage()));
//                             },
//                             child: SizedBox(
//                               height: 13.w,
//                               width: 13.w,
//                               child: const Image(
//                                   image: AssetImage(
//                                       'assets/images/rank1/menuicon.png')),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 50.w,
//                             height: 10.w,
//                             child: const Image(
//                                 image: AssetImage(
//                                     'assets/images/rank1/text1438leaderboardtext.png')),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pushReplacement(
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const NewBottomnavbar()));
//                             },
//                             child: Image(
//                                 height: 13.w,
//                                 width: 13.w,
//                                 image: const AssetImage(
//                                     'assets/images/rank1/path3676yellowicon.png')),
//                           ),
//                         ],
//                       ),
//                     ),
//                     medalIMage(13.w, 48.w),
//                     medalIMage(40.w, 37.w),
//                     medalIMage(66.w, 50.w),
//                     userPic(15.w, 58.w, "assets/images/rank1/g878userPic1.png"),
//                     userPic(43.w, 47.w, "assets/images/rank1/g854userpic2.png"),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5.w,
//                 ),
//                 Stack(
//                   children: [
//                     Column(
//                       children: [
//                         ListView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: 3,
//                             itemBuilder: ((context, index) {
//                               return NameTile(
//                                   number: index + 1,
//                                   title: "Lionel Andres Messi",
//                                   xp: "55990XP",
//                                   person: index == 0
//                                       ? "assets/images/rank1/cup.png"
//                                       : index == 1
//                                           ? 'assets/images/rank1/cup2.png'
//                                           : 'assets/images/rank1/cup3.png');
//                             })),
//                         SizedBox(
//                           height: 9.w,
//                         ),
//                         Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.white),
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: Column(
//                                 children: [
//                                   const SizedBox(
//                                     height: 30,
//                                   ),
//                                   ListView.builder(
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       shrinkWrap: true,
//                                       itemCount: 7,
//                                       itemBuilder: ((context, index) {
//                                         return NameTile(
//                                           high: index == 4 ? true : false,
//                                           number: index + 4,
//                                           title: "Lionel Andres Messi",
//                                           xp: "55990XP",
//                                           person:
//                                               'assets/images/rank1/PersonImage.png',
//                                           textcolor: Colors.white,
//                                           borderColor: index == 4
//                                               ? Colors.yellow.shade700
//                                               : Colors.lightBlueAccent,
//                                         );
//                                       }))
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                               top: -25,
//                               left: 20.w,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) =>
//                                           const Rankoutof10()));
//                                 },
//                                 child: Container(
//                                     alignment: Alignment.center,
//                                     height: 15.w,
//                                     width: 60.w,
//                                     decoration: BoxDecoration(
//                                         color: Colors.lightBlueAccent,
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: Border.all(color: Colors.blue)),
//                                     child: TextWidget(
//                                       text: 'Consolation Winners',
//                                       fontWeight: FontWeight.bold,
//                                       textSize: 13.sp,
//                                     )),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Positioned userPic(double left, top, String image) {
//     return Positioned(
//         left: left,
//         top: top,
//         child: ClipOval(
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           child: Image(
//               fit: BoxFit.fill,
//               height: 15.w,
//               width: 15.w,
//               image: AssetImage(
//                 image,
//                 // "assets/images/rank1/g878userPic1.png"
//               )),
//         ));
//   }

//   Positioned medalIMage(double left, top) {
//     return Positioned(
//       left: left,
//       // 250,
//       top: top,
//       // 210,
//       child: Image(
//           height: 28.w,
//           width: 20.w,
//           image: const AssetImage('assets/images/rank1/Image 2.png')),
//     );
//   }
// }
