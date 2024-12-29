import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String msg;

  final double textSize;

  final Color color1, color2;

  const GradientText(
      {super.key,
      required this.msg,
      required this.textSize,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    var gradient = LinearGradient(
      colors: [
        color1,
        color2,
      ],
    );

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(
          Rect.fromLTRB(
            0,
            0,
            bounds.width,
            bounds.height,
          ),
        );
      },
      child: Text(
        msg,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              offset: Offset(1, 1),
            )
          ],
        ),
      ),
    );
  }
}
