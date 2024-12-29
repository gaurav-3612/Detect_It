import 'package:detect_it/components/back_ground_blur.dart';
import 'package:detect_it/components/positioned_image.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

/*

Back Ground Animation
---------------------

File dealing with all the codes regarding rive animation used for shapes and the back ground image

=> Postioned Image of spline that is already made.
=> Back Ground Blur that is also made earlier.
=> Then there's animation. 

*/

class BackGroundAnimations extends StatelessWidget {
  const BackGroundAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Image assets for spline.
        PositionedImage(),

        // Back Ground Blur
        BackGroundBlur(
          x: 10,
          y: 10,
          widget: SizedBox(),
        ),

        // The animation.
        RiveAnimation.asset("assets/RiveAssets/shapes.riv"),

        // Blurring the animation for asthetcial vibes.
        BackGroundBlur(
          x: 10,
          y: 10,
          widget: SizedBox(),
        ),
      ],
    );
  }
}
