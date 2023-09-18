// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:skilldren/views/pages/Widgets/TextWidget.dart';

class EditprofilePage extends StatelessWidget {
  const EditprofilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const SizedBox(
                height: 250,
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/EditProfile/path40puplebg.png')),
              ),
              const Positioned(
                  top: -70,
                  left: -70,
                  child: Image(
                      image: AssetImage(
                          'assets/EditProfile/g54circlePurple.png'))),
              const Positioned(
                  top: -25,
                  left: -25,
                  child: Image(
                      image:
                          AssetImage('assets/EditProfile/g74redCircle.png'))),
              const Positioned(
                  bottom: 35,
                  left: 10,
                  child: Image(
                      image: AssetImage(
                          'assets/EditProfile/g78bgrrencircle.png'))),
              const Positioned(
                  bottom: 35,
                  left: 50,
                  child: Image(
                      image:
                          AssetImage('assets/EditProfile/g82pSmalcircle.png'))),
              const Positioned(
                  top: -35,
                  right: -35,
                  child: Image(
                      image:
                          AssetImage('assets/EditProfile/g90yellocircle.png'))),
              const Positioned(
                  top: -30,
                  right: 35,
                  child: Image(
                      image: AssetImage(
                          'assets/EditProfile/g78bgrrencircle.png'))),
              const Positioned(
                  top: 100,
                  right: 70,
                  child: Image(
                      height: 70,
                      width: 70,
                      image:
                          AssetImage('assets/EditProfile/g74redCircle.png'))),
              const Positioned(
                  top: 130,
                  right: 5,
                  child: Image(
                      height: 70,
                      width: 70,
                      image: AssetImage('assets/EditProfile/g194star.png'))),
              Positioned(
                  bottom: 20,
                  right: 70,
                  child: Container(
                    color: Colors.yellow,
                    child: const Image(
                        fit: BoxFit.fill,
                        color: Colors.yellow,
                        // height: 70,
                        // width: 70,
                        image:
                            AssetImage('assets/EditProfile/g258yelloline.png')),
                  )),
              Positioned(
                  bottom: 50,
                  right: 15,
                  child: Container(
                    height: 10,
                    width: 10,
                    color: Colors.yellow,
                    child: const Image(
                        fit: BoxFit.fill,
                        color: Colors.yellow,
                        // height: 70,
                        // width: 70,
                        image:
                            AssetImage('assets/EditProfile/g258yelloline.png')),
                  )),
              const Positioned(
                bottom: -50,
                right: 0,
                left: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Image(
                        image: AssetImage(
                            'assets/EditProfile/g690logoimage.png'))),
              ),
              const Positioned(
                top: 70,
                right: 50,
                child: Image(
                    image: AssetImage(
                        'assets/EditProfile/text570editProfileText.png')),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          TextWidget(
            text: "Profile Picture",
            textSize: 18,
          ),
          TextWidget(
            text: "( Max 4MB, 14 Aspect Ratio)",
            textSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
          ),
          const SizedBox(
            height: 20,
          ),
          const RedTitle(
            title: 'General Information',
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFomFieldWithTitle(
                        title: "First Name",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFomFieldWithTitle(
                        title: "Last Name",
                      ),
                    ),
                  ],
                ),
                TextFomFieldWithTitle(title: "Email Address"),
                TextFomFieldWithTitle(title: "Date of Birth"),
                TextFomFieldWithTitle(title: "Complete Address"),
                TextFomFieldWithTitle(title: " Select Country "),
                TextFomFieldWithTitle(title: "Select City"),
              ],
            ),
          ),
          const RedTitle(title: "Security"),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFomFieldWithTitle(title: "Update Phone"),
                TextFomFieldWithTitle(title: "Update Email"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RedTitle extends StatelessWidget {
  const RedTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.red.shade900]),
      ),
      child: TextWidget(text: title, color: Colors.white, textSize: 21.33),
    );
  }
}

class TextFomFieldWithTitle extends StatelessWidget {
  const TextFomFieldWithTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: title, color: Colors.grey, textSize: 16),
        const SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade200),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
