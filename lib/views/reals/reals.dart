// ignore_for_file: deprecated_member_use

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilldren/Provider/ReelProvider/reel_provider.dart';

import 'package:video_player/video_player.dart';

class Reals extends StatelessWidget {
  const Reals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reelProvider = Provider.of<ReelProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Reals'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: reelProvider.fetchAip(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: reelProvider.myadata == null
                    ? 0
                    : reelProvider.myadata.response.length,
                itemBuilder: ((context, index) {
                  return VideoItems(
                      looping: false,
                      autoplay: true,
                      videoPlayerController: VideoPlayerController.network(

                          // "https://skilldren.com/skilldren/reels/afbf649fb97cc3c7.mp4"
                          reelProvider.myadata.response[index].reelVideo
                              .toString()));
                }));
          },
        ));
  }
}

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  const VideoItems(
      {Key? key,
      required this.looping,
      required this.autoplay,
      required this.videoPlayerController})
      : super(key: key);

  @override
  State<VideoItems> createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      //allowFullScreen: true,
      // fullScreenByDefault: true,
      showOptions: true,

      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 6 / 9,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.pause();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
