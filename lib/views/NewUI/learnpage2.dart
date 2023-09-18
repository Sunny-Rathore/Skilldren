// import 'package:flutter/material.dart';

// import 'NewPage.dart';

// class LearmPAge2 extends StatefulWidget {
//   const LearmPAge2({Key? key}) : super(key: key);

//   @override
//   State<LearmPAge2> createState() => _LearmPAge2State();
// }

// class _LearmPAge2State extends State<LearmPAge2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Container(
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             image: const DecorationImage(
//                 image: AssetImage('assets/images/Asset3@4x.png')),
//             // color: Colors.blueGrey,
//             borderRadius: BorderRadius.circular(10)),
//         //color: Colors.blueGrey,
//         height: 60,
//         width: 60,
//         child: const Image(
//             fit: BoxFit.fill,
//             image: AssetImage(
//               "assets/images/Asset2@4x.png",
//             )),
//       ),
//       drawer: const NewPage(),
//       // drawer: const NewDrawer(),
//       //: AppBar()
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // SizedBox(
//             //   height: MediaQuery.of(context).size.height * 0.02,
//             // ),
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(20),
//               height: 130,
//               color: Colors.red,
//               child: Row(
//                 children: [
//                   Builder(builder: (context) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const NewPage()));
//                       },
//                       child: Container(
//                           height: 50,
//                           width: 50,
//                           margin: const EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                               //color: Colors.blue.shade300,
//                               borderRadius: BorderRadius.circular(13)),
//                           child: Image.asset(
//                             "assets/images/Asset 6@4x copy.png",
//                           )),
//                     );
//                   }),
//                   Expanded(child: Container()),
//                   Text(
//                     "Art".toUpperCase(),
//                     style: const TextStyle(
//                         fontSize: 30,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Expanded(child: Container()),
//                   Container(
//                       height: 50,
//                       width: 50,
//                       decoration: const BoxDecoration(
//                         //color: Colors.red,
//                         image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage(
//                               "assets/images/Asset 5@4x.png",
//                             )),
//                       ))
//                 ],
//               ),
//             ),

//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               width: MediaQuery.of(context).size.width - 30,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(
//                           "assets/images/AssetIndicagtorempty.png"))),
//               child: SizedBox(
//                 height: 20,
//                 width: MediaQuery.of(context).size.width / 2,
//                 child: const Image(
//                     image: AssetImage(
//                   "assets/images/Asset53@4x.png",
//                 )),
//               ),
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Expanded(
//                     child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     const Image(
//                         image: AssetImage(
//                       "assets/images/Asset51@4x-100.jpg",
//                     )),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(" Beginer>>"),
//                         Text(
//                           " Phase1",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     )
//                   ],
//                 )),
//                 const SizedBox(
//                   width: 15,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage("assets/images/Asset39@4x.png"
//                               // "assets/images/Asset33@4x.png",
//                               ))),
//                   height: 100,
//                   width: 300,
//                   child: Stack(
//                     children: [
//                       Row(
//                         children: [
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Positioned(
//                             left: 0,
//                             child: SizedBox(
//                               height: 30,
//                               width: 30,
//                               child: Image(
//                                   image: AssetImage(
//                                       "assets/images/Asset44@4x.png")),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: TextFormField(
//                                 decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Search",
//                             )),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   // child: const Image(
//                   //     image: AssetImage(
//                   //   "assets/images/Asset33@4x.png",
//                   // )),
//                 ),
//                 const Expanded(
//                   child: SizedBox(
//                     height: 50,
//                     width: 50,
//                     child: Image(
//                         image: AssetImage(
//                       "assets/images/Asset33@4x.png",
//                     )),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: Container(
//                   height: 100,
//                   color: Colors.red,
//                 )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: Container(
//                   height: 100,
//                   color: Colors.red,
//                 )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: Container(
//                   height: 100,
//                   color: Colors.red,
//                 )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                     child: Container(
//                   height: 100,
//                   color: Colors.red,
//                 )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
