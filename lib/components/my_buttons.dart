import 'package:flutter/material.dart';
import 'package:detect_it/main.dart';

/*

My Buttons

This file deals with all the buttons inside the application.
------------------------------------------------------------

Arguments customised according to need
=> Text : For Buttons
=> Function after tapping button
=> Icon : Icon for the button 
=> Color : BackGround Color

*/

class MyButtons extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget icon;

  const MyButtons({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: mq.width * .15,
          top: mq.height * .03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              "   $text",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
