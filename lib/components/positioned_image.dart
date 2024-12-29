import 'package:detect_it/main.dart';
import 'package:flutter/material.dart';

/*
Positioned Image
----------------

Positioned Image widget for spline image.

=> Used in different part of entire application.

*/

class PositionedImage extends StatelessWidget {
  const PositionedImage({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Positioned(
      width: mq.width * 1.7,
      bottom: mq.height * .3,
      left: mq.width * .3,
      child: Image.asset(
        "assets/Images/Spline.png",
      ),
    );
  }
}
