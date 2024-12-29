import 'package:detect_it/screens/auth/login_screen.dart';
import 'package:detect_it/screens/core_ui/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*
AUTH GATE

This is to check weather the user is logged in or not.
-----------------------------------------------------

User logged in then => Go to Home Screen 

User not logged in then => Go to Login Screen


*/

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If it's logged in then:
          if (snapshot.hasData) {
            return const HomeScreen();
          }

          //If it's not logged in then:
          else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
