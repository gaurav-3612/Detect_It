// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:detect_it/components/back_ground_animations.dart';
import 'package:detect_it/components/button_animation.dart';
import 'package:flutter/material.dart';
import 'package:detect_it/components/alert_dialogs.dart';
import 'package:detect_it/components/my_text_fields.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/auth/auth_service.dart';
import 'package:detect_it/screens/auth/login_screen.dart';
import 'package:rive/rive.dart' hide Image, LinearGradient;

/*

Register Screen 

This file is for all the UI content of Registering the user.

=> User Name
=> User Email
=> User Password
=> Confirm Password

And user can go back to the login screen for logining in.

*/

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RiveAnimationController riveAnimationController;
  final auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnfController = TextEditingController();

  void register() async {
    // When it's called show a progress indicator
    Dialogs.showLoadingAnimation(context);

    // Password and confirm password matches
    if (pwdController.text == cnfController.text) {
      // Attempt registering
      try {
        await auth.registerEmailPassword(
          emailController.text,
          pwdController.text,
        );
        // Remove Progress indicator.
        Navigator.pop(context);

        // When User is created
        Dialogs.showSnackbar(context, 'User is created. Login now!');
        log("User is created.");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      }
      // Checking for exceptions
      catch (e) {
        // Remove Progress indicator
        Navigator.pop(context);

        // When error arrives.
        Dialogs.showSnackbar(context, 'Error occured: $e');
        log(
          e.toString(),
        );
      }
    }

    // Password and confirm password doesn't matches
    else {
      // Remove Progress indicator
      Navigator.pop(context);

      // When User is created
      Dialogs.showSnackbar(context, "Passwords don't matches.");
      log("Passwords don't matches.");
    }
  }

  @override
  void initState() {
    super.initState();

    riveAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Body of register screen
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

          // Back Ground Animations
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
                    "Register Now!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .05,
                  ),

                  // Text Field for User-Name.
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .15,
                    ),
                    child: MyTextFields(
                      text: "Enter User-Name",
                      obscureText: false,
                      controller: nameController,
                      icon: Image.asset(
                        "assets/Images/profile.png",
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

                  // Text-Field for password
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
                    height: mq.height * .01,
                  ),

                  // Text-Field for confirming password
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .15,
                    ),
                    child: MyTextFields(
                      text: "Confirm Password",
                      obscureText: false,
                      controller: cnfController,
                      icon: Image.asset(
                        "assets/Images/unlock.png",
                        scale: 15,
                      ),
                    ),
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .03,
                  ),

                  // Animated Button
                  ButtonAnimation(
                    animationController: riveAnimationController,
                    press: () {
                      riveAnimationController.isActive = true;

                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          register();
                        },
                      );
                    },
                    image: "assets/Images/register.png",
                    text: "Register Now!",
                  ),

                  // Sized Box
                  SizedBox(
                    height: mq.height * .02,
                  ),

                  //Have a account can go back to login screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already a member.",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login now.",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
