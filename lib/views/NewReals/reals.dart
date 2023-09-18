import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilldren/views/NewUI/NewBottomNavBar.dart';

import '../../Provider/ReelProvider/reel_provider.dart';
import 'content_screen.dart';

class RealPage extends StatelessWidget {
  // final List<String> videos = [
  //   'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4'
  //       'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
  // ];

  const RealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reelProvider = Provider.of<ReelProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const NewBottomnavbar(selectedIndex: 4),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: FutureBuilder(
            future: reelProvider.fetchAip().whenComplete(() {}),
            builder: ((context, snapshot) {
              return SafeArea(
                child: Stack(
                  children: [
                    //We need swiper for every content
                    Swiper(
                      itemCount: reelProvider.myadata == null
                          ? 0
                          : reelProvider.myadata.response.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ContentScreen(
                            reelId: reelProvider.myadata.response[index].reelId,
                            liked: reelProvider.myadata.response[index].liked,
                            reelTotalLikes: reelProvider
                                .myadata.response[index].reelTotalLikes,
                            src: reelProvider.myadata.response[index].reelVideo
                                .toString());
                      },

                      // videos.length,
                      scrollDirection: Axis.vertical,
                    ),
                  ],
                ),
              );
            })));
  }
}
