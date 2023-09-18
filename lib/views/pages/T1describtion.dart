// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:skilldren/views/pages/DesActivity.dart';
// import '../../constant.dart';
// import '../NewUI/NewPage.dart';
// import '../../utils/color_utils.dart';
// import '../../utils/string_utils.dart';
// import '../NewUI/Indicator.dart';

// class T1Description extends StatefulWidget {
//   const T1Description({Key? key}) : super(key: key);

//   @override
//   State<T1Description> createState() => _T1DescriptionState();
// }

// class _T1DescriptionState extends State<T1Description> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Builder(builder: (context) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const NewPage()));
//                     },
//                     child: Container(
//                         height: 40,
//                         width: 40,
//                         margin: const EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(13)),
//                         child: Image.asset(
//                           "assets/images/Asset 6@4x copy.png",
//                         )),
//                   );
//                 }),
//                 Container(
//                     height: 40,
//                     width: 50,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage(
//                             "assets/images/Asset 5@4x.png",
//                           )),
//                     ))
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Indicator(),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Tutorial 1",
//               style: TextStyle(
//                   fontFamily: FontFamily.ballobhai2,
//                   color: Color(0Xff414042),
//                   fontSize: 21.33),
//               //style: baloobhai2.copyWith(fontSize: 21.33.sp),
//             ),
//             Text(
//               "Introduction To Colors",
//               style: TextStyle(
//                 fontFamily: FontFamily.ballobhai2,
//                 fontSize: 24,
//                 color: ColorUtils.text1,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Stack(
//               alignment: Alignment.center,
//               children: const [
//                 Image(
//                     color: Color(0XFF6D6E71),
//                     image: AssetImage(
//                         'assets/tutorialonepageimage/path298blackbg (1).png')),
//                 Image(
//                     image: AssetImage('assets/tutorialonepageimage/g364w.png')),
//                 Image(
//                     image: AssetImage(
//                         'assets/tutorialonepageimage/path370redplay.png')),
//               ],
//             ),
//             const Image(
//                 image: AssetImage(
//                     'assets/tutorialonepageimage/g612bgimagewithicon.png')),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const DesActivity()));
//               },
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   const Image(
//                       image: AssetImage(
//                           'assets/SketchingImages/g252bgPShade.png')),
//                   Text(
//                     "DESCRIPTION",
//                     style: baloobhai.copyWith(
//                         fontSize: 14.67,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               "This PDF contains all the Excersies you need to completebefore proceeding to the next tutorials. Download the PDFand get a print out. \nEtc. A text box",
//               style: baloobhai.copyWith(
//                 fontSize: 13.33,
//                 color: const Color(0xFF808285),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // const Center(
//             //   child: Image(
//             //       image: AssetImage(
//             //           'assets/SketchingImages/g670Dowlodabutton.png')),
//             // ),
//             // const Center(
//             //   child: Image(
//             //       image:
//             //           AssetImage('assets/SketchingImages/text668Download.png')),
//             // ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
