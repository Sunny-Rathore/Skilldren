// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/views/Live%20classes/freedemo.dart';
import 'package:skilldren/views/NewReals/reals.dart';
import 'package:skilldren/views/NewUI/category_page.dart';
import 'package:skilldren/views/NewUI/NewHome.dart';
import 'package:skilldren/views/Participate/participate.dart';

class NewBottomnavbar extends StatefulWidget {
  final int selectedIndex;
  const NewBottomnavbar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<NewBottomnavbar> createState() => _NewBottomnavbarState();
}

class _NewBottomnavbarState extends State<NewBottomnavbar> {
  Widget inactiveIcon(String image) {
    return SizedBox(
      width: 6.w,
      child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            image,
          )),
    );
  }

  Widget activeIcon(String image) {
    return SizedBox(
      height: 13.w,
      child: Image(fit: BoxFit.fill, image: AssetImage(image)),
    );
  }

  List<Widget> pages = [
    const CategoryPage(),
    const LiveClassesFreeDemo(),
    const NewHomePage(),
    const Particiapte(),
    const RealPage()
  ];
  void ontap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CategoryPage()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LiveClassesFreeDemo()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const NewHomePage()));
        break;
      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Particiapte()));
        break;
      case 4:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const RealPage()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        elevation: 15,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: widget.selectedIndex,
        onTap: ontap,
        unselectedFontSize: 8.sp,
        items: [
          BottomNavigationBarItem(
            label: "Learn",
            activeIcon: activeIcon("assets/images/AssetLEARN@4x.png"),
            icon: inactiveIcon('assets/images/inactivelearn.png'),
          ),
          BottomNavigationBarItem(
            label: "Live Classes",
            activeIcon: activeIcon("assets/images/Live Class@2x.png"),
            icon: inactiveIcon("assets/images/inactiveLiveClasses.png"),
          ),
          BottomNavigationBarItem(
            activeIcon: activeIcon("assets/images/ActiveHome17@4x.png"),
            icon: inactiveIcon("assets/images/inactiveHome.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: activeIcon("assets/images/participate@2x.png"),
            icon: inactiveIcon("assets/images/inactiveParticipate.png"),
            label: "Participate",
          ),
          BottomNavigationBarItem(
            activeIcon: activeIcon("assets/images/Reels@2x.png"),
            icon: SizedBox(
              width: 4.w,
              child: const Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images/inactiveShort.png")),
            ),
            label: "Short",
          ),
        ]);
  }
}
