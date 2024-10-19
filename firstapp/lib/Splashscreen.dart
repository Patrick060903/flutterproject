import 'package:flutter/material.dart';
import 'walkthrough.dart'; // Import the WalkthroughPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay before navigating to the WalkthroughPage
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to WalkthroughPage after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WalkthroughPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Your logo image in assets folder
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0B553E)),
            ),
          ],
        ),
      ),
    );
  }
}
