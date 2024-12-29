import 'dart:developer';
import 'package:detect_it/components/alert_dialogs.dart';
import 'package:detect_it/screens/core_ui/feature_screen.dart';
import 'package:detect_it/screens/core_ui/info_screen.dart';
import 'package:detect_it/screens/core_ui/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:detect_it/components/my_buttons.dart';
import 'package:detect_it/main.dart';
import 'package:detect_it/screens/auth/auth_service.dart';

/*

My Drawer

This is our menu drawer and accessed on the left side of the AppBar
-------------------------------------------------------------------

=> Logo of our application / person's picture if wanna customise
=> Home Screen
=> Feature Screen
=> Profile Screen
=> Info about application
=> Log-Out

*/

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final auth = AuthService();

  logOut() {
    try {
      auth.signOut();
      log("logged out");
    } catch (e) {
      log("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.transparent;

    return Drawer(
      backgroundColor: color,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffad0c4),
              Color(0xffff9a9e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Sized Box
              SizedBox(
                height: mq.height * .1,
              ),

              // Logo of our application
              Image.asset(
                "assets/Images/searching.png",
                scale: 3,
              ),

              SizedBox(
                height: mq.height * .05,
              ),

              MyButtons(
                icon: const Icon(
                  CupertinoIcons.home,
                  size: 30,
                ),
                text: "Home",
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              MyButtons(
                icon: Image.asset(
                  "assets/Images/features.png",
                  scale: 19,
                ),
                text: "Features",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FeatureScreen(),
                    ),
                  );
                },
              ),

              MyButtons(
                icon: Icon(
                  CupertinoIcons.person,
                  size: 30,
                ),
                text: "Profile",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileScreen(),
                    ),
                  );
                },
              ),

              MyButtons(
                icon: Icon(
                  CupertinoIcons.info,
                  size: 30,
                ),
                text: "About-us",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InfoScreen(),
                    ),
                  );
                },
              ),

              MyButtons(
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                ),
                text: "Log-out",
                onTap: () {
                  Dialogs.showLogoutDialogCupertino(context, logOut);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
