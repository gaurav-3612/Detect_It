import 'dart:developer';
import 'dart:io';
import 'package:detect_it/components/gradient_text.dart';
import 'package:detect_it/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:photo_gallery/photo_gallery.dart';

/*

View Picture File
-----------------

Picture that is going to be labled is showed here.

*/

class ViewPictureScreen extends StatefulWidget {
  final Medium medium;

  const ViewPictureScreen(this.medium, {super.key});

  @override
  State<ViewPictureScreen> createState() => _ViewPictureScreenState();
}

class _ViewPictureScreenState extends State<ViewPictureScreen> {
  late ImageLabeler imageLabeler;
  @override
  void initState() {
    super.initState();

    loadImageFile();

    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
    imageLabeler = ImageLabeler(options: options);
  }

  File? imageFile;

  loadImageFile() async {
    imageFile = await widget.medium.getFile();

    performImageLabelling();

    setState(() {
      imageFile;
    });
  }

  String results = "";

  performImageLabelling() async {
    InputImage inputImage = InputImage.fromFile(imageFile!);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    int i = 1;

    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;

      log("$text        $confidence");

      results += "$i. $text    ${confidence.toStringAsFixed(2)}\n";
      i++;
    }

    setState(() {
      results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text(
          "Your Picture",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffddd6f3),
                Color(0xfffaaca8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: mq.height * .05),
              child: SingleChildScrollView(
                child: Center(
                  child: imageFile != null
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: mq.width * .05),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              imageFile!,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ),
            ),

            // Sized Box for some space.
            SizedBox(
              height: mq.height * 0.02,
            ),

            // Gradient Text For Heading.
            const GradientText(
              msg: "Detected Objects",
              textSize: 23,
              color1: Colors.red,
              color2: Colors.blue,
            ),

            // Results printing on UI for selected image.
            Text(
              results == "" ? "Sorry, Can't find any." : results,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
