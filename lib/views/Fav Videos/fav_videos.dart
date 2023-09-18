import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skilldren/Provider/FavVideoProvider/fav_video_list.dart';

import '../../imageUrl/imageurl.dart';
import '../NewUI/NewBottomNavBar.dart';
import '../NewUI/NewPage.dart';
import '../pages/Profile.dart';
import '../pages/Widgets/Imagewidget.dart';
import '../pages/Widgets/TextWidget.dart';

class FavVideosList extends StatelessWidget {
  const FavVideosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favList = Provider.of<FavVideoListProvider>(context, listen: false);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.w),
          child: Builder(builder: (context) {
            return Container(
              alignment: Alignment.center,
              height: 12.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.white])),
              child: Padding(
                padding: EdgeInsets.only(
                    //horizontal: 5.w,
                    left: 3.w,
                    top: 8.w,
                    right: 3.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: SizedBox(
                        height: 10.w,
                        width: 10.w,
                        child: const ImageWidget(
                            assetName: 'assets/images/rank1/menuicon.png'),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageUrl.newIcon,
                          height: 10.w,
                          width: 10.w,
                        ),
                        SizedBox(
                            width: 35.w,
                            child: const ImageWidget(
                                assetName: ImageUrl.SkilldrenText)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        bottomNavigationBar: const NewBottomnavbar(
          selectedIndex: 0,
        ),
        drawer: const NewPage(),
        body: FutureBuilder(
          future: favList.fetchApi(),
          builder: (context, snapshot) {
            if (favList.mydata?.response?.length == 0) {
              return Center(child: TextWidget(text: "No Videos Added"));
            }
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              padding: const EdgeInsets.all(5),
              children: List.generate(
                  favList.mydata?.response?.length ?? 0,
                  (index) => favVideos(
                        thumbnail:
                            favList.mydata?.response[index].videoThumbnail,
                        link: favList.mydata?.response[index].video,
                      )),
            );
          },
        )

        //  ListView.builder(
        //   itemCount: 12,
        //   itemBuilder: (context, index) {
        //     return const favVideos();
        //   },
        // ),
        );
  }
}
