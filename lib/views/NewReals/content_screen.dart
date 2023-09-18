// ignore_for_file: deprecated_member_use

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:video_player/video_player.dart';

import '../../Provider/ReelDislike/reel_dislike_provider.dart';
import '../../Provider/ReelLike/reel_like_provider.dart';
import '../../Provider/ReelProvider/reel_provider.dart';
import 'like_icon.dart';

class ContentScreen extends StatefulWidget {
  final String? src;
  final int reelTotalLikes;
  final bool liked;
  final String reelId;

  const ContentScreen(
      {Key? key,
      this.src,
      required this.reelTotalLikes,
      required this.liked,
      required this.reelId})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool autoPlay = true;
  bool _liked = false;
  bool _play = true;
  bool test = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _videoPlayerController.pause();
    _chewieController!.pause();

    // if (_chewieController != null) {
    //   _chewieController!.dispose();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  if (_play == true) {
                    _videoPlayerController.pause();
                    setState(() {
                      _play = !_play;
                    });
                  } else {
                    _videoPlayerController.play();
                    setState(() {
                      _play = !_play;
                    });
                  }
                },
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        Visibility(
            visible: _play == false ? true : false,
            child: Center(
                child: GestureDetector(
              onTap: () {
                _videoPlayerController.play();
                setState(() {
                  _play = !_play;
                });
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 20.w,
              ),
            ))),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        option()
        // OptionsScreen(
        //   reelId: widget.reelId,
        //   liked: widget.liked,
        //   reelTotalLikes: widget.reelTotalLikes,
        // ),
      ],
    );
  }

  Widget option() {
    final likereelProvider =
        Provider.of<ReelLikeProvider>(context, listen: false);
    final reaalDislikeProvider =
        Provider.of<ReelDislikeProvider>(context, listen: false);
    final reelProvider = Provider.of<ReelProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person, size: 18),
                        radius: 16,
                      ),
                      const SizedBox(width: 6),
                      const Text('Skilldren Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontFamily: grandstander,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ])),
                      const SizedBox(width: 10),
                      const Icon(Icons.verified, size: 15),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Skilldren is beautiful and fast 💙❤💛 ..',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        'Original Audio - some music track--',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (test == false) {
                        await likereelProvider.fetchApi(widget.reelId);
                        Fluttertoast.showToast(
                            msg: likereelProvider.mydata?.response ?? '');
                        reelProvider.fetchAip();
                        setState(() {
                          test = !test;
                        });
                      } else {
                        await reaalDislikeProvider.fetchApi(widget.reelId);
                        Fluttertoast.showToast(
                            msg: reaalDislikeProvider.mydata?.response ?? '');
                        reelProvider.fetchAip();
                        setState(() {
                          test = !test;
                        });
                      }
                    },
                    child: Icon(
                      test == false ? Icons.favorite_outline : Icons.favorite,
                      color: test == false ? Colors.white : Colors.red,
                    ),
                  ),

                  Text(
                    widget.reelTotalLikes.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // const Icon(Icons.comment_rounded),
                  // const Text('1123'),
                  // const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  // Icon(Icons.more_vert, color: ColorUtils.text1),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
