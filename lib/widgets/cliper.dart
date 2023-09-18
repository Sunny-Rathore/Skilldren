import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0562500, size.height * 0.9227273);
    path0.quadraticBezierTo(size.width * 0.0398437, size.height * 0.8715909,
        size.width * 0.0343750, size.height * 0.8545455);
    path0.quadraticBezierTo(size.width * 0.0125000, size.height * 0.1000000,
        size.width * 0.0593750, size.height * 0.1136364);
    path0.cubicTo(
        size.width * 0.0875000,
        size.height * 0.0738636,
        size.width * 0.7843750,
        size.height * 0.0250000,
        size.width * 0.9062500,
        size.height * 0.1090909);
    path0.quadraticBezierTo(size.width * 0.9742188, size.height * 0.1340909,
        size.width * 0.9562500, size.height * 0.8045455);
    path0.lineTo(size.width * 0.9343750, size.height * 0.9000000);
    path0.quadraticBezierTo(size.width * 0.9085937, size.height * 0.9284091,
        size.width * 0.0562500, size.height * 0.9227273);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class ProfileBoxShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1177500, size.height * 0.8581667);
    path0.cubicTo(
        size.width * 0.0894167,
        size.height * 0.7910833,
        size.width * 0.0447500,
        size.height * 0.2405833,
        size.width * 0.0933333,
        size.height * 0.2087500);
    path0.cubicTo(
        size.width * 0.1310000,
        size.height * 0.1144167,
        size.width * 0.6452500,
        size.height * 0.1026667,
        size.width * 0.8362500,
        size.height * 0.1678333);
    path0.cubicTo(
        size.width * 0.9297500,
        size.height * 0.3325833,
        size.width * 0.9400000,
        size.height * 0.7738333,
        size.width * 0.8820000,
        size.height * 0.8453333);
    path0.cubicTo(
        size.width * 0.8313333,
        size.height * 0.8583333,
        size.width * 0.1626667,
        size.height * 0.8940833,
        size.width * 0.1177500,
        size.height * 0.8581667);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ThumbNailShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0043200, size.height * 0.9976000);
    path0.lineTo(size.width * 0.0057600, size.height * 0.1514667);
    path0.quadraticBezierTo(size.width * 0.0044000, size.height * 0.0487333,
        size.width * 0.0269200, size.height * 0.0233333);
    path0.quadraticBezierTo(size.width * 0.0803600, size.height * 0.0134667,
        size.width * 0.1140800, size.height * 0.0048000);
    path0.quadraticBezierTo(size.width * 0.9431200, size.height * -0.0097333,
        size.width * 0.9359200, size.height * 0.0502667);
    path0.quadraticBezierTo(size.width * 0.9970800, size.height * 0.0238667,
        size.width * 0.9923200, size.height * 0.9973333);
    path0.lineTo(size.width * 0.0043200, size.height * 0.9976000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ThumbNailBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0065600, size.height * 0.9892000);
    path0.quadraticBezierTo(size.width * 0.0083600, size.height * 0.3312000,
        size.width * 0.0046400, size.height * 0.0108000);
    path0.lineTo(size.width * 0.9921600, size.height * 0.0083000);
    path0.quadraticBezierTo(size.width * 0.9900000, size.height * 0.9634000,
        size.width * 0.9106000, size.height * 0.9544000);
    path0.cubicTo(
        size.width * 0.8854800,
        size.height * 1.0145000,
        size.width * 0.7098800,
        size.height * 0.9958000,
        size.width * 0.0065600,
        size.height * 0.9892000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
