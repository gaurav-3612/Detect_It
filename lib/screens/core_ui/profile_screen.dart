import 'dart:developer';

import 'package:detect_it/components/alert_dialogs.dart';
import 'package:detect_it/components/curved_bar.dart';
import 'package:detect_it/components/gradient_text.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/auth/auth_service.dart';
import 'package:flutter/material.dart';

/*

Profile Screen
--------------

This screen includes a person picture and name and e-Mail of the current user.

Also have a button for Logging-Out.

And a continous navigation bar easy transition between core screen of apps.


*/

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    dynamic logOut() {
      try {
        auth.signOut();
        log("logged out");
      } catch (e) {
        log("Error");
      }
    }

    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
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
          Padding(
            padding: EdgeInsets.only(top: mq.height * .02),
            child: Center(
              child: Column(
                children: [
                  // Image Logo
                  Image.asset(
                    "assets/Images/profile.png",
                    scale: 4,
                  ),

                  // Some space
                  SizedBox(
                    height: mq.height * .04,
                  ),

                  // Gradient Text saying Credentials
                  GradientText(
                      msg: "Credentials",
                      textSize: 24,
                      color1: Colors.redAccent,
                      color2: Colors.blue),

                  // Name and e-Mail
                  Text(
                    "Name: ${auth.getCurrentUser()!.displayName.toString()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "e-Mail: ${auth.getCurrentUser()!.email.toString()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .22),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 10,
                        shadowColor: Colors.green,
                        iconColor: Colors.redAccent,
                        foregroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        Dialogs.showLogoutDialogCupertino(context, logOut);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: mq.height * .018),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.logout,
                              size: 32,
                              weight: 1000,
                            ),
                            Text(
                              "Log-Out",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
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
        ],
      ),
      bottomNavigationBar: const CurvedBar(i: 2),
    );
  }
}
