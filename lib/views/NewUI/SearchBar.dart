// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/color_utils.dart';

class SearchBar extends StatefulWidget {
  String search;
  SearchBar({
    Key? key,
   required this.search,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 5.w,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                  height: 12.w,
                  width: 60.w,
                  // width: MediaQuery.of(context).size.width,
                  child: const Image(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/Searchbg.jpg'))),
              SizedBox(
                //  width: 250,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                        height: 27,
                        width: 30,
                        child: Image(
                            image: AssetImage("assets/images/Asset44@4x.png"))),
                    const SizedBox(
                      width: 5,
                    ),
                    const SizedBox(
                        height: 25,
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/sDivider.png'))),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 11.w,
                      width: 40.w,
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            widget.search = val;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "SEARCH",
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: ColorUtils.text2),
                        ),
                      ),
                    )
                    // Text(
                    //   "SEARCH",
                    //   style: TextStyle(
                    //       fontStyle: FontStyle.italic, color: ColorUtils.text2),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        const Expanded(
          child: SizedBox(
            height: 30,
            // width: 40,
            child: Image(
                image: AssetImage(
              "assets/images/Asset33@4x.png",
            )),
          ),
        ),
      ],
    );
  }
}
