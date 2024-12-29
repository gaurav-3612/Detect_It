import 'dart:ui';
import 'package:flutter/material.dart';

/*

Back Ground Blur
----------------

This file is to add back ground blur 
and you can add that how much and sized by 
adjusting size of widget ot type of widget.


*/

class BackGroundBlur extends StatelessWidget {
  final double x, y;
  final Widget? widget;
  const BackGroundBlur(
      {super.key, required this.x, required this.y, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
        child: widget,
      ),
    );
  }
}
