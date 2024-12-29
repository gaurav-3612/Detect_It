import 'package:detect_it/components/back_ground_blur.dart';
import 'package:detect_it/components/positioned_image.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore_for_file: use_build_context_synchronously

/*

Splash screen
-------------

Splash Screen pops up when app is first intialised or restarted while app is still loading in background.

*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const AuthGate(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Gradient For BackGroudn
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfffad0c4),
                  Color(0xffffd1ff),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Spline Image
          const PositionedImage(),

          // Background Blur
          const BackGroundBlur(
            x: 5,
            y: 5,
            widget: SizedBox(),
          ),

          Positioned(
            top: mq.height * .2,
            left: mq.width * .3,
            child: SvgPicture.asset(
              "assets/SVG/Circle.svg",
            ),
          ),

          const BackGroundBlur(
            x: 5,
            y: 5,
            widget: SizedBox(),
          ),

          Positioned(
            top: mq.height * .4,
            child: SvgPicture.asset(
              "assets/SVG/Hexagon.svg",
            ),
          ),

          const BackGroundBlur(
            x: 5,
            y: 5,
            widget: SizedBox(),
          ),

          Positioned(
            top: mq.height * .7,
            left: mq.width * .4,
            child: SvgPicture.asset(
              "assets/SVG/Triangle.svg",
            ),
          ),

          const BackGroundBlur(
            x: 5,
            y: 5,
            widget: SizedBox(),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: mq.width * .05,
                    right: mq.width * .2,
                    top: mq.height * .05,
                  ),
                  child: SizedBox(
                    height: 620,
                    child: Column(
                      children: [
                        const Text(
                          "Welcome to DetectIt",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: mq.height * .07,
                        ),
                        const Text(
                          "Empowering you with real-time object detection. Project created with Flutter, Google Colab, Rive.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "MADE IN INDIA WITH ❤️ ",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
