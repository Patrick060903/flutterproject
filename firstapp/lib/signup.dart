import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'login.dart'; // Import the LoginPage

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2F1), Colors.white],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, top: 2.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi,\nSign Up!",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B553E),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Join OptiFood now. It's free.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      // Name Field
                      Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0B553E),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          hintText: 'Enter your name',
                        ),
                      ),
                      SizedBox(height: 16),
                      // Email Field
                      Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0B553E),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0), // Adjusted padding
                          hintText: 'Enter your email',
                        ),
                      ),
                      SizedBox(height: 16),
                      // Password Field
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0), // Adjusted padding
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(height: 30),
                      // Signup Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle signup action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0B553E),
                            padding: EdgeInsets.symmetric(
                                horizontal: 160, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    decorationThickness: 2.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
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
                SizedBox(height: 160),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "By continuing, you agree to OptiFood's",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Terms of Use",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey[600],
                                decorationThickness: 2.0,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "and",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 4),
                          RichText(
                            text: TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.grey[600],
                                decorationThickness: 2.0,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
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
      ),
    );
  }
}
