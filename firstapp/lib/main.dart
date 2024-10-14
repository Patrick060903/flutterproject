import 'package:flutter/material.dart';
import 'walkthrough.dart';
import 'dashboard.dart'; // Import DashboardPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WalkthroughPage(), // Set WalkthroughPage as the initial screen
    );
  }
}
