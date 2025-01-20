import 'package:detect_it/firebase_options.dart';
import 'package:detect_it/screens/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

// Global Object for device size screen (Media Querying)
late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Gemini.init(apiKey: 'AIzaSyCbxo5p_hNcXAEUjTOQ67rP9F8O7tmDY7c');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "DetectIt",
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
