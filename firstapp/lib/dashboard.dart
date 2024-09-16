import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
        backgroundColor: Colors.white, // Set background color to white
        elevation: 0,
        toolbarHeight: 70, // Adjust height as needed
        title: Row(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20, // Adjust size as needed
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png', // Path to your circular logo image
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
            // Text
            Expanded(
              child: Text(
                'OptiFood',
                style: TextStyle(
                  fontSize: 20, // Adjust size as needed
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B553E), // Text color to match theme
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          // Notification Bell
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFF0B553E)),
            onPressed: () {
              // Handle notification button press
            },
          ),
          // Sidebar Icon
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Color(0xFF0B553E)),
                onPressed: () {
                  // Open the sidebar
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
          SizedBox(width: 8), // Spacing between icons
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Grey area with profile image
            Container(
              color: Colors.grey[200], // Grey background
              padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0,
                  80.0), // Padding for top, left, right, bottom
              width: double.infinity, // Full width of the drawer
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60, // Increased size for profile image
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile_menu.png', // Path to your profile menu image
                        fit: BoxFit.cover,
                        width: 80, // Increased width
                        height: 80, // Increased height
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu Text
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                'Menu', // Title text for the menu
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B553E), // Text color to match theme
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: Text('Home'),
                    onTap: () {
                      // Handle Home button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: Text('Inventory'),
                    onTap: () {
                      // Handle Inventory button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: Text('Grocery Checklist'),
                    onTap: () {
                      // Handle Grocery Checklist button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: Text('Meal Planner'),
                    onTap: () {
                      // Handle Meal Planner button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: Text('Reports'),
                    onTap: () {
                      // Handle Reports button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      // Handle Profile button click
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.75, // Adjust width to 75% of the screen width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                ),
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: Center(
              child: Text(
                "", // No content here as requested
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // White background for BottomAppBar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background for the button
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                    'assets/home.png'), // Path to your home button image
                iconSize: 30,
                onPressed: () {
                  // Handle home button press
                },
              ),
            ),
            // Inventory Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background for the button
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                    'assets/inventory.png'), // Path to your inventory button image
                iconSize: 30,
                onPressed: () {
                  // Handle inventory button press
                },
              ),
            ),
            // Grocery List Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background for the button
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                    'assets/grocery_list.png'), // Path to your grocery list button image
                iconSize: 30,
                onPressed: () {
                  // Handle grocery list button press
                },
              ),
            ),
            // Meal Planner Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background for the button
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset(
                    'assets/meal_planner.png'), // Path to your meal planner button image
                iconSize: 30,
                onPressed: () {
                  // Handle meal planner button press
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
