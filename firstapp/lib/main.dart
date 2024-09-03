import 'package:flutter/material.dart';
import 'walkthrough.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WalkthroughPage(), // Set WalkthroughPage as the initial screen
    );
  }
}
