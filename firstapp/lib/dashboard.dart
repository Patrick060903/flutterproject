import 'package:firstapp/ProfilePage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // State variable to track if the notification drawer is open or closed
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Set the background color of the dashboard
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back button
        backgroundColor: Colors.white, // Set AppBar background color to white
        elevation: 0, // Remove shadow
        toolbarHeight: 70, // Set height of the AppBar
        title: Row(
          children: [
            GestureDetector(
              // Navigate to ProfilePage when logo is tapped
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.png', // Logo image
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Danjo Bakes', // Title of the App
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B553E), // Title color
                ),
                overflow: TextOverflow.ellipsis, // Handle overflow
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                color: Color(0xFF0B553E)), // Notification icon
            onPressed: () {
              setState(() {
                _isDrawerOpen =
                    !_isDrawerOpen; // Toggle the notification drawer
              });
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.85, // Set width of the search bar
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the search bar
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // Shadow color
                          spreadRadius: 2, // Spread radius of the shadow
                          blurRadius: 5, // Blur radius of the shadow
                          offset: Offset(0, 3), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: Colors.grey), // Search icon
                        hintText: 'Search...', // Placeholder text
                        border: InputBorder.none, // No border
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 20.0), // Padding inside the TextField
                      ),
                    ),
                  ),
                ),
                // Summary section
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Summary', // Summary title
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green[800], // Summary title color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'More', // More options text
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130, // Height of the summary box
                            width: double.infinity,
                            color: Colors
                                .white, // Background color of the summary box
                            child: Center(
                              child: Text(
                                'Wala pa', // Placeholder text
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Expiring Soon', // Title for expiring soon items
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Product list section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Product',
                                  style:
                                      TextStyle(fontSize: 14)), // Column header
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Ano lagay dito',
                                  style: TextStyle(
                                      fontSize: 14)), // Placeholder text
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Quantity',
                                  style:
                                      TextStyle(fontSize: 14)), // Column header
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Eat By',
                                  style:
                                      TextStyle(fontSize: 14)), // Column header
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      // List of products (dummy data)
                      ...List.generate(4, (index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(
                                      0.5)), // Divider between products
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (colIndex) {
                              return Expanded(
                                child: Container(
                                  height: 67, // Height of each product entry
                                  color: Colors.white, // Background color
                                  alignment: Alignment.center,
                                  child: Text('R${index + 1}C${colIndex + 1}',
                                      style: TextStyle(
                                          fontSize:
                                              16)), // Placeholder text for product info
                                ),
                              );
                            }),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                // "See more" button at the bottom right
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        // Add navigation to more details
                      },
                      child: Text(
                        'See more...', // Text for the button
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Notification Drawer
          if (_isDrawerOpen) // Show the drawer if it's open
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDrawerOpen =
                      false; // Close the drawer when tapping outside
                });
              },
              child: Container(
                color: Colors.black54, // Semi-transparent background
              ),
            ),
          AnimatedPositioned(
            duration:
                Duration(milliseconds: 300), // Animation duration for sliding
            right: _isDrawerOpen ? 0 : -300, // Slide in and out from the right
            top: 0,
            bottom: 0,
            child: Container(
              width: 300, // Width of the notification drawer
              color: Colors.white, // Background color of the drawer
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Notifications', // Title of the notifications section
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(), // Divider line
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(
                          8), // Padding for the notification list
                      children: [
                        ListTile(title: Text('New message from Danjo Bakes!')),
                        ListTile(
                            title: Text('Reminder: Check your inventory.')),
                        ListTile(
                            title: Text('Don’t forget to plan your meals!')),
                        // Add more notification items here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomAppBarItem(
              iconPath: 'assets/home.png',
              label: 'Home', // Label for Home button
              context: context,
              onTap: () {}, // Action for Home button
            ),
            _bottomAppBarItem(
              iconPath: 'assets/meal_planner.png',
              label: 'Meal Plan', // Label for Meal Plan button
              context: context,
              onTap: () {}, // Action for Meal Plan button
            ),
            _bottomAppBarItem(
              iconPath: 'assets/inventory.png',
              label: 'Inventory', // Label for Inventory button
              context: context,
              onTap: () {}, // Action for Inventory button
            ),
            _bottomAppBarItem(
              iconPath: 'assets/grocery_list.png',
              label: 'Grocery Checklist', // Label for Grocery Checklist button
              context: context,
              onTap: () {}, // Action for Grocery Checklist button
            ),
          ],
        ),
      ),
    );
  }

  // Function to create bottom navigation items
  Widget _bottomAppBarItem({
    required String iconPath,
    required String label,
    required BuildContext context,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () => onTap(), // Execute the onTap action
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 27,
            height: 27, // Size of the icon
          ),
          SizedBox(height: 3),
          Text(
            label, // Text label for the icon
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
