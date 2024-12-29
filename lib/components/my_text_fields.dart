import 'package:flutter/material.dart';

/*

My Text Fields

This is file for My Text Fields
-------------------------------

=> For all the text fields required in our applications


*/

class MyTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscureText;
  final Image icon;

  const MyTextFields(
      {super.key,
      required this.controller,
      required this.text,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      //Decorations:
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: icon,

        hintStyle: const TextStyle(
          color: Colors.black,
        ),

        // Without texting inside the textfield.
        enabledBorder: const OutlineInputBorder(
          //Border Radius
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),

          // Border Side
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),

        // When we're typing inside the text-field.
        focusedBorder: const OutlineInputBorder(
          //Border Radius
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),

          // Border Side
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),

      // Check whether we want to show or hide
      obscureText: obscureText,
    );
  }
}
