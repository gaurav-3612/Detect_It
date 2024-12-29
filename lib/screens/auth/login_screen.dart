import 'dart:developer';
import 'package:detect_it/components/alert_dialogs.dart';
import 'package:detect_it/components/back_ground_animations.dart';
import 'package:detect_it/components/button_animation.dart';
import 'package:flutter/material.dart';
import 'package:detect_it/components/my_text_fields.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/auth/auth_service.dart';
import 'package:detect_it/screens/auth/register_screen.dart';
import 'package:rive/rive.dart' hide Image, LinearGradient;

/*

Login Screen 

This file is for all the UI compoments of Login Screen
------------------------------------------------------

=> User Email
=> User Password

=> Google Login

And user can go to register screen for registering new id.

*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late RiveAnimationController riveAnimationController1,
      riveAnimationController2;

  final auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    riveAnimationController1 = OneShotAnimation(
      "active",
      autoplay: false,
    );
    riveAnimationController2 = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  void login() async {
    // When it's called show a progress indicator
    Dialogs.showLoadingAnimation(context);

    // Try log-in.
    try {
      await auth.loginEmailPassword(emailController.text, pwdController.text);

      // When it's finished then
      Navigator.pop(context);
    }

    // If any exception.
    catch (e) {
      // When it's finished then
      Navigator.pop(context);

      // When error arrives.
      Dialogs.showSnackbar(context, 'Error occured: $e');

      log(
        e.toString(),
      );
    }
  }

/*
  void gLogin() async {
    Dialogs.showProgressBar(context);
    try {
      await auth.signInWithGoogle();

      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      // When error arrives.
      Dialogs.showSnackbar(context, 'Error occured: $e');

      log(
        e.toString(),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
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

          // Back Ground Animations.
          const BackGroundAnimations(),

          // Text Field and Buttons.{Starts the code of the entire front UI}
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  // Sized Box
                  SizedBox(
                    height: mq.height * .05,
                  ),

                  // Text
                  const Text(
                    "Login Now!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .05,
                  ),

                  // Text-Field for email address
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .15,
                    ),
                    child: MyTextFields(
                      text: "Enter e-Mail Address",
                      obscureText: false,
                      controller: emailController,
                      icon: Image.asset(
                        "assets/Images/gmail.png",
                        scale: 17,
                      ),
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .01,
                  ),

                  // Text-Field for email address
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .15,
                    ),
                    child: MyTextFields(
                      text: "Enter Password",
                      obscureText: true,
                      controller: pwdController,
                      icon: Image.asset(
                        "assets/Images/lock.png",
                        scale: 17,
                      ),
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .007,
                  ),

                  // Forgot Password
                  Padding(
                    padding: EdgeInsets.only(left: mq.width * .37),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  ButtonAnimation(
                    animationController: riveAnimationController1,
                    press: () async {
                      riveAnimationController1.isActive = true;

                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          login();
                        },
                      );
                    },
                    image: "assets/Images/invitation.png",
                    text: "Login-now",
                  ),
                  // Sized Box
                  SizedBox(
                    height: mq.height * .02,
                  ),

                  // Register Now Button with its Text.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member?",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register now.",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .1,
                  ),

                  // Animated Button
                  ButtonAnimation(
                    animationController: riveAnimationController2,
                    press: () async {
                      riveAnimationController2.isActive = true;

                      Future.delayed(
                        const Duration(seconds: 1),
                        () async {
                          Dialogs.showLoadingAnimation(context);

                          await auth.signInWithGoogle();

                          Navigator.pop(context);
                        },
                      );
                    },
                    image: "assets/Images/google.png",
                    text: "Sign-in",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously
