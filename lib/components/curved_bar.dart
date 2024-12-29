import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:detect_it/screens/core_ui/home_screen.dart';
import 'package:detect_it/screens/core_ui/profile_screen.dart';
import 'package:detect_it/screens/core_ui/feature_screen.dart';
import 'package:flutter/material.dart';

/*

Curved Navigation Bar
---------------------

Deals with the navigation bar and it's animations.

=> Icons regarding pages are added.
=> Index is taken as input according to the page user is on.
=> Navigation according to the index you've gone. 

*/

class CurvedBar extends StatelessWidget {
  const CurvedBar({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.pink.shade100,
      backgroundColor: Colors.blue.shade300,
      items: [
        Image.asset(
          "assets/Images/gallery.png",
          scale: 14,
        ),
        Image.asset(
          "assets/Images/features.png",
          scale: 14,
        ),
        Image.asset(
          "assets/Images/profile_icon.png",
          scale: 14,
        ),
      ],
      index: i,
      onTap: (index) async {
        if (index == 0) {
          await Future.delayed(
            const Duration(milliseconds: 700),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            ),
          );
        } else if (index == 1) {
          await Future.delayed(
            const Duration(milliseconds: 700),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const FeatureScreen(),
            ),
          );
        } else if (index == 2) {
          await Future.delayed(
            const Duration(milliseconds: 700),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const ProfileScreen(),
            ),
          );
        }
      },
    );
  }
}
