import 'package:flutter/material.dart';

class VideoRecordPage extends StatefulWidget {
  const VideoRecordPage({Key? key}) : super(key: key);

  @override
  State<VideoRecordPage> createState() => _VideoRecordPageState();
}

class _VideoRecordPageState extends State<VideoRecordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Row(
          children: [Text("data")],
        )
      ],
    ));
  }
}
