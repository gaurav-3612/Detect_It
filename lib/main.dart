import 'package:detect_it/firebase_options.dart';
import 'package:detect_it/screens/core_ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Global Object for device size screen (Media Querying)
late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
