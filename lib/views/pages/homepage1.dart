// // ignore_for_file: non_constant_identifier_names

// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:skilldren/Models/getAllVideos/getallvideos.dart';
// import 'package:skilldren/utils/NewPage.dart';
// import 'package:http/http.dart' as http;

// class Homepage1 extends StatefulWidget {
//   const Homepage1({Key? key}) : super(key: key);

//   @override
//   State<Homepage1> createState() => _Homepage1State();
// }

// class _Homepage1State extends State<Homepage1> {
//   @override
 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         drawer: const Drawer(
//           child: NewPage(),
//         ),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
//             IconButton(onPressed: () {}, icon: const Icon(Icons.call))
//           ],
//           iconTheme: const IconThemeData(color: Colors.black),
//           elevation: 0.0,
//           title: const Text(
//             "Home",
//             style: TextStyle(color: Colors.black),
//           ),

//           // leading: Container(
//           //   alignment: Alignment.center,
//           //   child:const Icon(Icons.menu),
//           // ),
//         ),
//         body: Stack(
//           children: [
//             SizedBox(
//               child: const Image(
//                 image: AssetImage('assets/images/Background.png'),
//                 fit: BoxFit.fill,
//               ),
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 60,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width - 0.6,
//                           child: Stack(
//                             alignment: Alignment.centerLeft,
//                             children: [
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: 75,
//                                 width: MediaQuery.of(context).size.width - 60,
//                                 decoration: BoxDecoration(
//                                     boxShadow: const [
//                                       BoxShadow(color: Colors.white)
//                                     ],
//                                     borderRadius: BorderRadius.circular(48),
//                                     border: Border.all(
//                                         color: Colors.blue, width: 1.5)),
//                               ),
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 110,
//                                     width: 110,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                             image: NetworkImage(
//                                                 'https://1.bp.blogspot.com/-ku8CB0kbBHY/YSyM219ArSI/AAAAAAAAWak/4ZNpXfTHlkkO2j0qoDuOuCKkBI7QhkfnwCLcBGAsYHQ/s1041/girl-cartoon-cute-dp-images%2B%25281%2529.jpg'),
//                                             fit: BoxFit.fill),
//                                         //  color: Colors.red,
//                                         border: Border.all(
//                                             color: Colors.blue, width: 2),
//                                         borderRadius: const BorderRadius.only(
//                                           topLeft: Radius.circular(60),
//                                           topRight: Radius.circular(85),
//                                           bottomLeft: Radius.circular(80),
//                                           bottomRight: Radius.circular(60),
//                                         )),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const Text(
//                                         "Hello ! Amayara",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Color(0XFFFE028B)),
//                                       ),
//                                       // const Text("  Current XP, Ex- 250/600",
//                                       //     style: TextStyle(
//                                       //         color: Color(0XFFFE028B))),
//                                       // Container(
//                                       //   //alignment: Al,
//                                       //   height: 10,
//                                       //   width:
//                                       //       MediaQuery.of(context).size.width -
//                                       //           250,
//                                       //   decoration: BoxDecoration(
//                                       //       // borderRadius: BorderRadius.circular(50),
//                                       //       border: Border.all(
//                                       //     color: Colors.black,
//                                       //   )),
//                                       // ),

//                                       SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width -
//                                                 200,
//                                         child: Row(
//                                           children: [
//                                             Container(
//                                               //alignment: Al,
//                                               height: 10,
//                                               width: 70,
//                                               // width: MediaQuery.of(context)
//                                               //         .size
//                                               //         .width *
//                                               //     0.2,

//                                               decoration: BoxDecoration(
//                                                   color: Colors.yellow,
//                                                   // borderRadius: BorderRadius.circular(50),
//                                                   border: Border.all(
//                                                     color: Colors.black,
//                                                   )),
//                                             ),
//                                             Container(
//                                               //alignment: Al,
//                                               height: 10,
//                                               width: 120,
//                                               // width: MediaQuery.of(context)
//                                               //         .size
//                                               //         .width -
//                                               //     250,
//                                               decoration: BoxDecoration(
//                                                   // borderRadius: BorderRadius.circular(50),
//                                                   border: Border.all(
//                                                 color: Colors.black,
//                                               )),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const Text(
//                                         "  Current Ranking #123",
//                                         style: TextStyle(color: Colors.red),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         _Box(
//                             'Recorded Videos',
//                             "https://cdn.vectorstock.com/i/1000x1000/44/74/back-to-school-card-with-girl-leaves-and-sun-vector-16584474.webp",
//                             () {}),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         _Box(
//                             'Live Videos',
//                             "https://previews.123rf.com/images/yusufdemirci/yusufdemirci2007/yusufdemirci200700078/150867828-kids-summer-camp.jpg?fj=1",
//                             () {}),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         _Box(
//                             'Competition & Task',
//                             "https://cdn.vectorstock.com/i/1000x1000/31/22/children-painting-banner-kids-drawing-on-wall-vector-31723122.webp",
//                             () {}),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         _Box(
//                             'Reels',
//                             "https://cdn.vectorstock.com/i/1000x1000/18/57/kids-certificate-children-education-diploma-vector-21731857.webp",
//                             () {}),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               border:
//                                   Border.all(color: Colors.black, width: 3)),
//                           child: const Text(
//                             "Recomended for you",
//                             style: TextStyle(fontSize: 20, letterSpacing: 1),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   _banner()
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }

//   Widget _banner() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         CarouselSlider.builder(
//           itemCount: 5,
//           itemBuilder: (context, index, _) {
//             return Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Transform.rotate(
//                     angle: 0.09,
//                     child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 10),
//                         alignment: Alignment.topCenter,
//                         decoration: BoxDecoration(
//                             //color: Colors.amber,
//                             // image: const DecorationImage(
//                             //     image: AssetImage('assets/images/thumnail.jpg'),
//                             //     fit: BoxFit.fill),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               width: 3,
//                               color: Colors.black,
//                             )),
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 100,
//                                 width: 180,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     border: Border.all(
//                                       width: 3,
//                                       color: Colors.black,
//                                     ),
//                                     image: const DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: AssetImage(
//                                           'assets/images/thumnail.jpg',
//                                         ))),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               const Text(
//                                 "Video -Title",
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               const SizedBox(
//                                 height: 8,
//                               ),
//                               const Text("Description")
//                             ],
//                           ),
//                         )
//                         // Text(
//                         //     "Continue Learning \n  (Video which\nwas last played)"),
//                         ),
//                   ),
//                 ),
//                 Container(
//                   height: 80,
//                   width: 80,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/Link.png'))),
//                 )
//               ],
//             );
//           },
//           options: CarouselOptions(
//             viewportFraction: 0.55,
//             enableInfiniteScroll: true,
//             height: 240,
//             aspectRatio: 2.5,
//             autoPlay: true,
//             onPageChanged: (index, _) {
//               setState(
//                 () {
//                   currentLate = index;
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _Box(String title, url, VoidCallback ontab) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 60),
//           child: Container(
//             alignment: Alignment.center,
//             height: 200,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage(url
//                         // "https://images.wallpapersden.com/image/download/aladdin-2019-movie-banner-8k_a2plaGqUmZqaraWkpJRnamtlrWZpaWU.jpg"

//                         )),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.black, width: 3)),
//             child: Container(
//               width: 100,
//               height: 50,
//               decoration: BoxDecoration(
//                   // color: Colors.orange,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: Colors.black, width: 3)),
//               child: Row(
//                 children: const [Icon(Icons.play_circle), Text('Play')],
//               ),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: ontab,
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             width: MediaQuery.of(context).size.width * 0.6,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.black, width: 3),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const [
//                     Icon(Icons.video_camera_back),
//                     Text("all Videos -20"),
//                     Icon(Icons.notifications),
//                     Text("data"),
//                     Icon(Icons.favorite),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// //  Column(
//                     //   children: [
//                     //     Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //       children: [
//                     //         _card('Recorded video', Icons.video_library_outlined,
//                     //             () {
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //               builder: (context) =>
//                     //                   const RecordTabBar(), //dancing ,singing,Art,
//                     //             ),
//                     //           );
//                     //         }, Colors.teal),
//                     //         _card('Live Videos', Icons.live_tv_rounded, () {
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //               builder: (context) => const LiveClasses(),
//                     //             ),
//                     //           );
//                     //         }, Colors.yellow.shade900),
//                     //       ],
//                     //     ),
//                     //     const SizedBox(
//                     //       height: 50,
//                     //     ),
//                     //     Row(
//                     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     //       children: [
//                     //         _card('Competition & Task', Icons.task, () {
//                     //           Navigator.push(
//                     //             context,
//                     //             MaterialPageRoute(
//                     //               builder: (context) => const Screen2(),
//                     //             ),
//                     //           );
//                     //         }, Colors.yellow.shade900),
//                     //         _card(
//                     //           'Reels',
//                     //           Icons.live_tv_rounded,
//                     //           () {},
//                     //           Colors.teal,
//                     //         ),
//                     //       ],
//                     //     )
//                     //   ],
//                     // ),
