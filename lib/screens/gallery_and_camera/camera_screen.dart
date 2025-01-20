import 'dart:developer';
import 'dart:io';
import 'package:detect_it/components/gradient_text.dart';
import 'package:detect_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';

/*

Camera Screen
-------------

This is the file where Picture is captured from Camera and details will be shown from it.

Just UI of the stuff and a Bottom Navigation Bar for navigation between screens. 


*/

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler imageLabeler;

  @override
  void initState() {
    super.initState();

    imagePicker = ImagePicker();

    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
    imageLabeler = ImageLabeler(options: options);
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabelling();

      setState(() {
        image;
      });
    }
  }

  String results = "";

  performImageLabelling() async {
    InputImage inputImage = InputImage.fromFile(image!);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    results = "";

    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;

      log("$text        $confidence");

      results += "$text    ${confidence.toStringAsFixed(2)}\n";
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
          "Camera",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
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

      // Body of the entire screen.
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: image == null
                    ? Column(
                        children: [
                          Image.asset(
                            "assets/Images/take_picture.png",
                            height: mq.height * .7,
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * .03,
                          vertical: mq.height * .02,
                        ),
                        child: Image.file(image!),
                      ),
              ),

              // Gradient Text For Heading.
              if (image != null)
                const GradientText(
                  msg: "Detected Objects",
                  textSize: 23,
                  color1: Colors.red,
                  color2: Colors.blue,
                ),

              // Results printing on UI for selected image.
              Text(
                results,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Button to capture image.
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .18,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 253, 105, 117),
                        Color.fromARGB(255, 254, 200, 125),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  height: mq.height * .063,
                  child: InkWell(
                    onTap: captureImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.camera,
                          size: 34,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        image == null
                            ? Text(
                                "Capture Image",
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              )
                            : Text(
                                "Capture Again",
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: mq.height * .1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
