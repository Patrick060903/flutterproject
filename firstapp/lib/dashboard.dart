import 'package:firstapp/grocerylistpage.dart';
import 'package:firstapp/inventorypage.dart';
import 'package:firstapp/login.dart';
import 'package:firstapp/mealplannerpage.dart';
import 'package:flutter/material.dart';
import 'notifications.dart'; // Make sure to import the NotificationsPage

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                toolbarHeight: 70,
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDrawerOpen =
                              !_isDrawerOpen; // Toggle profile drawer
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.cover,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Dan Joseph Bonao',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B553E),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: Color(0xFF0B553E)),
                    onPressed: () {
                      // Navigate to the NotificationsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationsPage()),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Search...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF0B553E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'More',
                                style: TextStyle(
                                  color: Color(0xFF0B553E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 130,
                            width: double.infinity,
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                'Wala pa',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Expiring Soon',
                            style: TextStyle(
                              color: Color(0xFF0B553E),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                  child: const Text('Product',
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text('Ano lagay dito',
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text('Quantity',
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text('Eat By',
                                      style: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ...List.generate(4, (index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(4, (colIndex) {
                                  return Expanded(
                                    child: Container(
                                      height: 67,
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Text(
                                          'R${index + 1}C${colIndex + 1}',
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See more...',
                            style: TextStyle(
                              color: Color(0xFF0B553E),
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
            ],
          ),
          // Dark overlay when drawer is open
          if (_isDrawerOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDrawerOpen = false;
                });
              },
              child: Container(
                color: Colors.black54,
              ),
            ),
          // Drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isDrawerOpen ? 0 : -300,
            top: 0,
            height: MediaQuery.of(context).size.height, // Cover full height
            child: Container(
              width: 300,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'User 101',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Username Household',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B553E),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/profile_menu.png',
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B553E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Profile'),
                          onTap: () {
                            // Navigate to ProfilePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications),
                          title: const Text('Notifications & Alerts'),
                          onTap: () {
                            // Navigate to the NotificationsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.lightbulb),
                          title: const Text('Tips'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.report),
                          title: const Text('Report'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text('History'),
                          onTap: () {},
                        ),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Settings and Support',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B553E),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings and Privacy'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.help),
                          title: const Text('Help Center'),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () {
                            // Navigate to the LoginPage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPage()), // Adjusted to navigate to LoginPage
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                // Refresh DashboardPage for Home
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/home.png', height: 24), // Your image path
                  const Text('Home', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Inventory Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/inventory.png',
                      height: 24), // Placeholder
                  const Text('Inventory', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Grocery List Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryListPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/grocery_list.png',
                      height: 24), // Placeholder
                  const Text('Grocery List', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Meal Planner Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MealPlannerPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/meal_planner.png',
                      height: 24), // Placeholder
                  const Text('Meal Planner', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF0B553E), // Green text color
          ),
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true, // Center the title
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Grey Container for the top section with rounded corners
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set background to light grey
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // Round bottom left corner
                  bottomRight:
                      Radius.circular(30.0), // Round bottom right corner
                ),
              ),
              height: MediaQuery.of(context).size.height *
                  0.21, // Adjust height as needed
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1), // Decrease space above the image
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_menu.png'),
                    ),
                    const SizedBox(height: 8), // Decrease space below the image
                    const Text(
                      'Dan Joseph Bonao',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '@Danjo',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            // Additional space below the grey container
            const SizedBox(height: 40),
            // Menu Items below the grey container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Align items to the start
                children: [
                  // Profile Menu Item
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              const Color(0xFF0B553E), // Green background color
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Padding around the icon
                        child: const Icon(
                          Icons.person,
                          size: 24,
                          color: Colors.white, // White color for the icon
                        ),
                      ),
                      const SizedBox(width: 16), // Space between icon and text
                      const Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(), // Pushes the arrow icon to the right
                      const Icon(
                        Icons.arrow_forward_ios, // Right arrow icon
                        size: 16, // Smaller size for the arrow
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Notifications Menu Item with Circular Background
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              const Color(0xFF0B553E), // Green background color
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Padding around the icon
                        child: const Icon(
                          Icons.notifications,
                          size: 24,
                          color: Colors.white, // White color for the icon
                        ),
                      ),
                      const SizedBox(width: 16), // Space between icon and text
                      const Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(), // Pushes the arrow icon to the right
                      const Icon(
                        Icons.arrow_forward_ios, // Right arrow icon
                        size: 16, // Smaller size for the arrow
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Family List Menu Item with Circular Background
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              const Color(0xFF0B553E), // Green background color
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // Padding around the icon
                        child: const Icon(
                          Icons.family_restroom,
                          size: 24,
                          color: Colors.white, // White color for the icon
                        ),
                      ),
                      const SizedBox(width: 16), // Space between icon and text
                      const Text(
                        'Family List',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(), // Pushes the arrow icon to the right
                      const Icon(
                        Icons.arrow_forward_ios, // Right arrow icon
                        size: 16, // Smaller size for the arrow
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Settings and Privacy Menu Item
                  const Divider(),
                  Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 24,
                      ),
                      const SizedBox(width: 16), // Space between icon and text
                      const Text(
                        'Settings and Privacy',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(), // Pushes the arrow icon to the right
                      const Icon(
                        Icons.arrow_forward_ios, // Right arrow icon
                        size: 16, // Smaller size for the arrow
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Help Center Menu Item with Normal Icon
                  Row(
                    children: [
                      const Icon(
                        Icons.help,
                        size: 24,
                      ),
                      const SizedBox(width: 16), // Space between icon and text
                      const Text(
                        'Help Center',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(), // Pushes the arrow icon to the right
                      const Icon(
                        Icons.arrow_forward_ios, // Right arrow icon
                        size: 16, // Smaller size for the arrow
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Additional space below the menu items
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Grey background color
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Red text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
