import 'package:flutter/material.dart';

class WalkthroughPage extends StatefulWidget {
  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  final PageController _pageController =
      PageController(viewportFraction: 0.75); // Space in between ng mga slides
  int _currentPage = 0;

  final List<String> _images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Opti',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0B553E),
                      ),
                    ),
                    TextSpan(
                      text: 'Food',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF0B553E),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Meal Repurposing Application',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF1F8265),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Container ng pageview at indicators
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16), // Adjust spacing
                              width: 340, // Increased width
                              height: 500, // Increased height
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    30), // Increased borderRadius
                                border: Border.all(
                                  color: Color(0xFF0B553E),
                                  width: 4,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(_images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Space between kay slides at 'yung 3 buttons
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _images.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 12,
                            width: _currentPage == index ? 16 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.blueAccent
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30), // Space sa taas ng buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0B553E),
                              padding: EdgeInsets.symmetric(vertical: 6.0),
                              minimumSize: Size(158,
                                  40), // Pinakamababang size na pwede ilagay
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 6), // Space between kay signup at login
                          SizedBox(
                            width: 158,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFFFFFF),
                                padding: EdgeInsets.symmetric(vertical: 6.0),
                                side: BorderSide(
                                  color: Color(0xFF0B553E),
                                  width: 4, // Border thickness ni login button
                                ),
                                minimumSize: Size(158, 40), // Set size
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF0B553E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
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
