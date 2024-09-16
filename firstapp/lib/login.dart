import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dashboard.dart'; // Import DashboardPage
import 'signup.dart'; // Import SignupPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button at the top
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,\nWelcome Back!",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B553E),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Login to continue your journey with OptiFood.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email or Username:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0B553E),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email or username',
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Password:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0B553E),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to DashboardPage after login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0B553E),
                          padding: EdgeInsets.symmetric(
                              horizontal: 167, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to SignupPage when "Signup" is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600], // Greyish color
                            ),
                            children: [
                              TextSpan(
                                text: "Signup",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Colors.black, // Black color for "Signup"
                                  fontWeight: FontWeight.bold, // Bolder font
                                  decoration: TextDecoration
                                      .underline, // Underline "Signup"
                                  decorationColor:
                                      Colors.black, // Color of underline
                                  decorationThickness:
                                      2.0, // Thickness of underline
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to SignupPage when "Signup" is clicked
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      220), // Add space between the last item and bottom of the screen
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "By continuing, you agree to OptiFood's ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600], // Greyish color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4), // Space between lines
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Terms of Use",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600], // Greyish color
                              decoration: TextDecoration
                                  .underline, // Underline "Terms of Use"
                              decorationColor:
                                  Colors.grey[600], // Color of underline
                              decorationThickness:
                                  2.0, // Thickness of underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle tap on "Terms of Use"
                              },
                          ),
                        ),
                        SizedBox(
                            width:
                                4), // Space between "Terms of Use" and "Privacy Policy"
                        RichText(
                          text: TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600], // Greyish color
                              decoration: TextDecoration
                                  .underline, // Underline "Privacy Policy"
                              decorationColor:
                                  Colors.grey[600], // Color of underline
                              decorationThickness:
                                  2.0, // Thickness of underline
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle tap on "Privacy Policy"
                              },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
