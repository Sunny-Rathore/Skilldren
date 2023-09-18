// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ShortPage extends StatefulWidget {
  const ShortPage({Key? key}) : super(key: key);

  @override
  State<ShortPage> createState() => _ShortPageState();
}

class _ShortPageState extends State<ShortPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Center(child: Text("ShortPage"))]));
  }
}
