import 'package:detect_it/components/curved_bar.dart';
import 'package:detect_it/components/widget_tiles.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/gallery_and_camera/camera_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*

Feature Screen
--------------

This is the file where we've widget tiles in use \.

Just UI of the stuff and a Bottom Navigation Bar for navigation between screens. 


*/

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text(
          "Features",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffad0c4),
                Color(0xffff9a9e),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: mq.height * .02),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CameraScreen()));
                  },
                  child: WidgetTiles(
                    title: 'Capture Image With Camera',
                    description:
                        "Tap to open the camera and \ncapture an image.",
                    imageAddress: "assets/Images/camera_image.png",
                    iconData: CupertinoIcons.camera,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CurvedBar(i: 1),
    );
  }
}
