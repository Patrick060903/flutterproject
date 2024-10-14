import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import the DashboardPage
import 'inventorypage.dart'; // Import the InventoryPage
import 'grocerylistpage.dart'; // Import the GroceryListPage

void main() {
  runApp(MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  const MealPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MealPlannerPage(),
    );
  }
}

class MealPlannerPage extends StatefulWidget {
  const MealPlannerPage({super.key});

  @override
  _MealPlannerPageState createState() => _MealPlannerPageState();
}

class _MealPlannerPageState extends State<MealPlannerPage> {
  int _selectedIndex = 1; // Meal Plan tab is selected by default

  static final List<Widget> _pages = <Widget>[
    DashboardPage(), // Home Page content
    MealPlanPage(), // Meal Planner Page content
    InventoryPage(), // Inventory Page content
    GroceryListPage(), // Grocery List Page content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the DashboardPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here if needed
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Home page
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/home.png', height: 24),
                  const Text('Home', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2; // Inventory page
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/inventory.png', height: 24),
                  const Text('Inventory', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 3; // Grocery List page
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/grocery_list.png', height: 24),
                  const Text('Grocery List', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Meal Planner page
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/meal_planner.png', height: 24),
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

class MealPlanPage extends StatelessWidget {
  const MealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  // Handle backward navigation within the meal plan week
                },
              ),
              const Text(
                'Sept 9 - Sept 15',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Handle forward navigation within the meal plan week
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              return Column(
                children: [
                  Text(
                    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text((9 + index).toString()),
                ],
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle Breakfast planning
              },
              child: const Text('BREAKFAST'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Lunch planning
              },
              child: const Text('LUNCH'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Dinner planning
              },
              child: const Text('DINNER'),
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'No meals to show',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            // Add new meal
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
