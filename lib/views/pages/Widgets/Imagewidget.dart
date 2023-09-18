// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String assetName;
  const ImageWidget({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(fit: BoxFit.fill, image: AssetImage(assetName));
  }
}

class NetworkImageWidget extends StatelessWidget {
  final IconData? erroricon;
  final String image;
  const NetworkImageWidget({
    Key? key,
    required this.image,
    this.erroricon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: image,
      placeholder: (context, url) => Container(
        color: Colors.white,
      ),
      errorWidget: (context, url, error) => InkWell(
        child: Icon(
          erroricon ?? Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
