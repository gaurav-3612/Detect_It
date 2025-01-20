import 'dart:developer';
import 'dart:io';

import 'package:detect_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MathNotes extends StatefulWidget {
  const MathNotes({super.key});

  @override
  State<MathNotes> createState() => _MathNotesState();
}

class _MathNotesState extends State<MathNotes> {
  File? imageQuestion;
  late ImagePicker imagePicker;

  String? answer;
  bool isLoading = false;

  // In it state
  @override
  void initState() {
    super.initState();

    imagePicker = ImagePicker();
  }

  selectImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: selectedImage!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
      ],
    );

    setState(() {
      imageQuestion = File(croppedFile!.path);

      isLoading = true;
    });

    final Gemini gemini = Gemini.instance;

    gemini.textAndImage(
        text: "Solve this problem.",

        /// text
        images: [await imageQuestion!.readAsBytes()]

        /// list of images
        ).then((value) {
      setState(() {
        answer = (value?.content?.parts?.last.text ?? '');
        isLoading = false;
      });

      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => log('textAndImageInput', error: e));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text(
          "Math Notes",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: imageQuestion == null ? 300 : null,
                width: mq.width,
                child: imageQuestion == null
                    ? const Text(
                        "No Image yet.\nClick One Now.",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Image.file(
                        imageQuestion!,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading == false && answer == null
                  ? const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                      child: Text(
                        "Take a picture and we'll solve it for you.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : isLoading == true
                      ? LoadingAnimationWidget.twistingDots(
                          leftDotColor: const Color(0xFF1A1A3F),
                          rightDotColor: const Color(0xFFEA3799),
                          size: mq.width * .1,
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: mq.width * .05,
                            vertical: mq.height * 0.02,
                          ),
                          child: Text(
                            answer ?? "",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
              SizedBox(
                height: mq.height * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .18),
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
                    onTap: selectImage,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image,
                          size: 34,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Upload Image",
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
