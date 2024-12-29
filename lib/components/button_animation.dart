import 'package:detect_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:flutter/material.dart';

class ButtonAnimation extends StatelessWidget {
  const ButtonAnimation({
    super.key,
    required RiveAnimationController animationController,
    required this.press,
    required this.image,
    required this.text,
  }) : _animationController = animationController;

  final RiveAnimationController _animationController;
  final VoidCallback press;
  final String image;

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 100,
        width: 260,
        child: Stack(
          children: [
            SizedBox(
              child: RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_animationController],
              ),
            ),
            Positioned.fill(
              top: 8,
              child: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: mq.width * .06,
                    ),
                    Image.asset(
                      image,
                      height: mq.width * .11,
                      scale: 12.2,
                    ),
                    SizedBox(
                      width: mq.width * .03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 27),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
