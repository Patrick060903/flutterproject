import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import the SplashScreen
import 'dashboard.dart';
import 'walkthrough.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiFood',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
