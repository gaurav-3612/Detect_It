import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*
AUTHENTICATION SERVICES

This handles authentication services across the entire project
--------------------------------------------------------------

=> Log-in {e-Mail and Password}
=> Sign-in with G-Mail {Google}
=> Register {e-Mail and Password}
=> Log-Out
=> Delete Account {If required}

*/

class AuthService {
  // Getting the instance of firebase auth
  final auth = FirebaseAuth.instance;

  // Get the current user and UID
  User? getCurrentUser() => auth.currentUser;
  String currentUserUID() => auth.currentUser!.uid;

  // Log-in Using e-Mail and Password
  Future<UserCredential> loginEmailPassword(String email, password) async {
    // Attempt Log-in
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }

    // Catch any error if there is.
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Register Using e-Mail and Password
  Future<UserCredential> registerEmailPassword(String email, password) async {
    //Attempt Login
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }

    // Exception
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign in with google
  signInWithGoogle() async {
    // Begin interactive sign-in pop-up
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // If user cancels the sign-in
    if (gUser == null) return;

    // Check whether the user has logged in or not.
    // Obtain Auth Details From Request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Create a new credentail for our user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally sign-in
    return await auth.signInWithCredential(credential);
  }

  // Log-Out
  Future<void> signOut() async {
    await auth.signOut();
  }
}
