import 'package:detect_it/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/*

Alert Dialogs

This is file for Alert Dialogs
---------------------------------------------
Like showing SnackBar and Progress Indicator.

And while logging out created two dialogs for iOS and android
{
=> Cupertino for both iOS and android.
=> Simple alert dialogs for android and iOS.
}


*/

class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            msg,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: .5,
              wordSpacing: 1,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade100,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressBar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void showLoadingAnimation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: const Color(0xFFEA3799),
          size: mq.width * .1,
        ),
      ),
    );
  }

  static void showLogoutDialog(BuildContext context, Function function) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.pink.shade50,
        title: const Text(
          "Log-Out",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: const Text(
          "Do you want to log-out.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              function();

              Navigator.pop(context);
            },
            child: Text(
              "Log-Out",
              style: TextStyle(fontSize: 20, color: Colors.red.shade300),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  static void showLogoutDialogCupertino(
      BuildContext context, Function function) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text(
          "Log-Out",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          "Do you want to log-out?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          ),
          TextButton(
            onPressed: () {
              function();

              Navigator.pop(context);
            },
            child: Text(
              "Log-Out",
              style: TextStyle(fontSize: 20, color: Colors.redAccent.shade400),
            ),
          ),
        ],
      ),
    );
  }
}
