import 'package:detect_it/main.dart';
import 'package:flutter/material.dart';

class RichTextSpan extends StatelessWidget {
  final String boldText, normalText;

  const RichTextSpan(
      {super.key, required this.boldText, required this.normalText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.width * .06),
      child: RichText(
        text: TextSpan(
          text: boldText, // Default text
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold), // Default style
          children: [
            TextSpan(
              text: normalText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
