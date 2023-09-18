// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'package:intro_slider/scrollbar_behavior_enum.dart';
// import 'package:skilldren/views/pages/home_page.dart';
// import 'package:skilldren/views/pages/login_and_Signup/welcome_page.dart';

// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }

// class _IntroScreenState extends State<IntroScreen> {
// // creating List of Slide objects
// // to store data of all intro slides
//   List<Slide> slides = [];

//   @override
//   void initState() {
//     super.initState();

//     // initializing slides at
//     // the runtime of app
//     slides.add(
//       Slide(
//         backgroundOpacity: 0.0,
//         backgroundImageFit: BoxFit.fill,
//         backgroundImage: "assets/images/6.png",
//         title: "",
//         maxLineTitle: 2,
//         styleTitle: const TextStyle(
//           color: Colors.green,
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//         ),
//         description: "",
//         styleDescription: const TextStyle(
//           color: Colors.green,
//           fontSize: 20.0,
//         ),
//         marginDescription: const EdgeInsets.only(
//             left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//         backgroundColor: Colors.yellow,
//         directionColorBegin: Alignment.topLeft,
//         directionColorEnd: Alignment.bottomRight,
//         onCenterItemPress: () {},
//       ),
//     );
//     slides.add(
//       Slide(
//         backgroundOpacity: 0.0,
//         backgroundImageFit: BoxFit.fill,
//         title: "",
//         styleTitle: const TextStyle(
//           color: Colors.white,
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//         ),
//         description: "",
//         styleDescription: const TextStyle(
//           color: Colors.white,
//           fontSize: 20.0,
//         ),
//         backgroundImage: "assets/images/4.png",
//         directionColorBegin: Alignment.topRight,
//         directionColorEnd: Alignment.bottomLeft,
//       ),
//     );
//     slides.add(
//       Slide(
//         backgroundOpacity: 0.0,
//         backgroundImageFit: BoxFit.fill,
//         title: "",
//         styleTitle: const TextStyle(
//           color: Colors.white,
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold,
//         ),
//         description: "",
//         styleDescription: const TextStyle(
//           color: Colors.white,
//           fontSize: 20.0,
//         ),
//         backgroundImage: "assets/images/3.png",
//         directionColorBegin: Alignment.topCenter,
//         directionColorEnd: Alignment.bottomCenter,
//         maxLineTextDescription: 3,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       // List slides
//       slides: this.slides,

//       // Skip button
//       renderSkipBtn: TextButton(
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (context) => const WelcomePage()));
//           },
//           child: const Text(
//             "Skip",
//             style: TextStyle(fontSize: 20, color: Color(0XFFB15BE1)),
//           )),

//       // Next button
//       renderNextBtn: const Icon(
//         Icons.navigate_next,
//         color: Color(0XFFB15BE1),
//         size: 40.0,
//       ),
//       // Done button
//       onDonePress: () {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const WelcomePage()));
//       },
//       renderDoneBtn: const Text("Done",
//           style: TextStyle(fontSize: 20, color: Color(0XFFB15BE1))),

//       // Dot indicator
//       colorDot: Colors.white,
//       colorActiveDot: const Color(0XFFB15BE1),
//       sizeDot: 13.0,

//       // Show or hide status bar
//       hideStatusBar: true,
//       backgroundColorAllSlides: Colors.black,

//       // Scrollbar
//       verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
//     );
//   }
// }
