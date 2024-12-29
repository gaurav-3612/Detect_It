import 'package:detect_it/components/rich_text_span.dart';
import 'package:detect_it/main.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffad0c4),
      appBar: AppBar(
        backgroundColor: Color(0xfffad0c4),
      ),
      body: Column(
        children: [
          // For some space
          SizedBox(
            height: mq.height * .03,
          ),

          // Logo of our application
          Image.asset(
            "assets/Images/searching.png",
            scale: 3,
          ),

          // For some space
          SizedBox(
            height: mq.height * .05,
          ),

          // Text describing our application
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Feature 1
              RichTextSpan(
                boldText: 'Image Analysis: ',
                normalText:
                    'The app can analyze still images, identifying and classifying objects within them. This is useful for tasks such as image categorization, content moderation, and visual search.',
              ),

              // Adding some space
              SizedBox(
                height: mq.height * .03,
              ),

              // Feature 2
              RichTextSpan(
                boldText: 'User-Friendly Interface: ',
                normalText:
                    'The app provides a user-friendly interface that allows users to easily interact with the system.',
              ),

              // Some Space
              SizedBox(
                height: mq.height * .03,
              ),

              // Feature 3
              RichTextSpan(
                boldText: 'Privacy and Security: ',
                normalText:
                    'The app provides entire model to run over the device itself with no cloud processing for privacy and for security it uses proper sign-in method.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
