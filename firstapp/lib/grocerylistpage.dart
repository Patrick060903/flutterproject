import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firstapp/dashboard.dart';
import 'package:firstapp/inventorypage.dart';
import 'package:firstapp/mealplannerpage.dart';

class GroceryListPage extends StatefulWidget {
  @override
  _GroceryListPageState createState() => _GroceryListPageState();
}

class _GroceryListPageState extends State<GroceryListPage> {
  List<Map<String, String>> groceryLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Grocery Checklist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B553E),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF0B553E),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF0B553E)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Adjusted spacing without search box
            Expanded(
              child: groceryLists.isEmpty
                  ? Center(
                      child: Text(
                        'No list to show',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0B553E),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: groceryLists.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              margin: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFF0B553E),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    groceryLists[index]['name']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    groceryLists[index]['date']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Empty box below the grocery list item
                            Container(
                              height: 100, // Adjust the height as needed
                              color: Colors
                                  .white, // Optional color for the white background
                              child: Column(
                                children: [
                                  Container(
                                    height: 30, // Height for the black line
                                    color: Colors
                                        .black, // Color for the black line
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            '          Item', // Replace with your item name
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                60), // Space between Item Name and Quantity
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            'Quantity',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                16), // Space between Quantity and Unit
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            'Unit',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          8.0), // Optional padding for the container
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Add Button with Text
                                          Row(
                                            children: [
                                              Container(
                                                width:
                                                    38, // Width of the add button
                                                height:
                                                    38, // Height of the add button
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                      0xFF0B553E), // Green background
                                                  shape: BoxShape
                                                      .circle, // Circular shape
                                                ),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.add, // Add icon
                                                    color: Colors
                                                        .white, // Icon color
                                                  ),
                                                  onPressed: () {
                                                    // Navigate to GroceryListDetailPage
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            GroceryListDetailPage(
                                                          listName:
                                                              groceryLists[
                                                                      index]
                                                                  ['name']!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                  width:
                                                      8), // Space between the button and text
                                              Text(
                                                'Add Ingredients', // Label text
                                                style: TextStyle(
                                                  fontSize:
                                                      12, // Font size for the label
                                                  color: Colors
                                                      .green, // Text color
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Edit and Delete Icons
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.edit, // Edit icon
                                                  size:
                                                      20, // Size of the edit icon
                                                ),
                                                onPressed: () {
                                                  // Add your edit button functionality here
                                                },
                                              ),
                                              SizedBox(
                                                  width:
                                                      1), // Space between icons
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete, // Delete icon
                                                  size:
                                                      20, // Size of the delete icon
                                                ),
                                                onPressed: () {
                                                  // Show a confirmation dialog before deletion
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Confirm Deletion'),
                                                        content: Text(
                                                            'Are you sure you want to delete this item?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                groceryLists
                                                                    .removeAt(
                                                                        index); // Remove the item at the current index
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child:
                                                                Text('Delete'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showAddListDialog(context);
                },
                child: Text('Add a New List'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0B553E),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/home.png', height: 24),
                  Text('Home', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/inventory.png', height: 24),
                  Text('Inventory', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryListPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/grocery_list.png', height: 24),
                  Text('Grocery List', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPlannerPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/meal_planner.png', height: 24),
                  Text('Meal Planner', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddListDialog(BuildContext context) {
    final TextEditingController listNameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: 450,
            height: 400,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add New List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'List Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: listNameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select Date',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                            dateController.text =
                                DateFormat('MMM d, yyyy').format(selectedDate);
                          });
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (listNameController.text.isNotEmpty) {
                      setState(() {
                        groceryLists.add({
                          'name': listNameController.text,
                          'date': dateController.text,
                        });
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add list'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B553E),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Grocery List Detail Page

class GroceryListDetailPage extends StatelessWidget {
  final String listName;

  GroceryListDetailPage({required this.listName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$listName Grocery Checklist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B553E),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF0B553E),
        ),
      ),
      body: Center(
        child: Text(
          'No items to show',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF008D23),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
        },
        child: Icon(Icons.add, size: 32),
        backgroundColor: Color(0xFF0B553E),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/home.png', height: 24),
                  Text('Home', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/inventory.png', height: 24),
                  Text('Inventory', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryListPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/grocery_list.png', height: 24),
                  Text('Grocery List', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPlannerPage()),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/meal_planner.png', height: 24),
                  Text('Meal Planner', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New class for the Add Item Page

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

String? _selectedUnit;
String? _selectedCategory;

class _AddItemPageState extends State<AddItemPage> {
  String _selectedOption = 'search';
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];
  String _searchQuery = '';
  TextEditingController _expDateController = TextEditingController();
  Map<String, int> _savedItems = {}; // Tracks saved items and their quantities
  int _quantity = 1; // Default quantity

  @override
  void dispose() {
    _expDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 260,
          alignment: Alignment.center,
          child: Text(
            'Add Items',
            style: TextStyle(
              color: Color(0xFF0B553E),
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1),
              // Search and Manual buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _oblongButton('Text Search', 150, 30, () {
                    setState(() {
                      _selectedOption = 'search';
                    });
                  }, _selectedOption == 'search'),
                  SizedBox(width: 10),
                  _oblongButton('Manual', 150, 30, () {
                    setState(() {
                      _selectedOption = 'manual';
                    });
                  }, _selectedOption == 'manual'),
                ],
              ),
              SizedBox(height: 10),
              // Build Content Based on Selection
              _selectedOption == 'search'
                  ? _buildSearchContent()
                  : _buildManualContent(),
              SizedBox(height: 5),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _oblongButton(String label, double width, double height,
      VoidCallback onPressed, bool isSelected) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          padding: EdgeInsets.zero,
          backgroundColor: isSelected ? Color(0xFF0B553E) : Colors.white,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Color(0xFF0B553E),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 390, // Set your desired width here
          height: 45, // Set your desired height here
          child: TextField(
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Search for an item',
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14, // Set your desired font size here
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(height: 20),
        _buildRectangleBoxes(),
      ],
    );
  }

  Widget _buildManualContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFieldLabel('Item Name'),
        SizedBox(height: 10),
        _buildTextField('Enter item name'),
        SizedBox(height: 10),
        SizedBox(height: 1),
        _buildTextFieldLabel(
            'Quantity                              Weight/Volume Unit'),
        SizedBox(height: 10),
        _buildQuantityControl(),
        SizedBox(height: 20),
        _buildTextFieldLabel1('Category'),
        SizedBox(height: 10),
      ],
    );
  }

  String? _selectedCategory;
  Widget _buildTextFieldLabel1(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 8), // Space between label and dropdown
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          hint: Text('Select category'),
          value: _selectedCategory, // The currently selected category
          items: <String>['vegetable', 'fruits', 'meat'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue; // Update selected category
            });
          },
        ),
      ],
    );
  }

  Widget _buildTextField1(String hint) {
    return Container(
      height: 70.0,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _buildTextFieldLabel(String label) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      height: 70.0,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Align items with space between
      children: [
        // Minus button
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF008D23),
          ),
          child: IconButton(
            icon: Icon(Icons.remove, color: Colors.white),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                if (_quantity > 1) {
                  _quantity--;
                }
              });
            },
          ),
        ),
        // Quantity display
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 1), // Adjust distance between minus and quantity
          child: Text(
            '$_quantity',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Add button
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF008D23),
          ),
          child: IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
        ),
        // Weight/Volume Unit Dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align items to the end
          children: [
            // Dropdown for unit selection
            Container(
              width: 200, // Set width of the dropdown
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Add border to the dropdown
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                hint: Text('Select unit'),
                value: _selectedUnit, // The currently selected unit
                items: <String>['pieces', 'kg', 'grams'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUnit = newValue; // Update selected unit
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRectangleBoxes() {
    List<String> filteredItems = _searchQuery.isEmpty
        ? items
        : items
            .where((item) =>
                item.toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();

    if (filteredItems.isEmpty) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: Text(
          'No items found',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Column(
      children: filteredItems.map((item) => _buildRectangleBox(item)).toList(),
    );
  }

  Widget _buildRectangleBox(String text) {
    bool isSaved = _savedItems.containsKey(text); // Check if item is saved
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSaved) {
            // If already saved, remove it from saved items
            _savedItems.remove(text);
          } else {
            // If not saved, show the edit quantity dialog
            _showEditQuantityDialog(text);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 80,
        decoration: BoxDecoration(
          color: isSaved
              ? Colors.green[100]
              : Colors.white, // Highlight saved item
          border: Border.all(color: Color(0xFF0B553E)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItemDetail(text), // Item Name
            _buildItemDetail('Storage'),
            _buildItemDetail(
                'Quantity: ${_savedItems[text] ?? 1}'), // Show saved quantity
            _buildItemDetail('Expiry Date'),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDetail(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: Color(0xFF0B553E)),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Show confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        20), // Reduced vertical padding for a more compact dialog
                content: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Makes the dialog size based on its content
                  children: [
                    Text(
                      'Are you sure you want to add these ingredients to the grocery checklist?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16), // Adjust text size
                    ),
                  ],
                ),
                actionsPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10), // Adjusted padding to move buttons closer
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // No button with white background and green border
                      Container(
                        width: 120,
                        height: 40, // Set the height of the container
                        decoration: BoxDecoration(
                          color: Colors.white, // White background
                          border: Border.all(
                              color: Color(0xFF008D23)), // Green border
                          borderRadius:
                              BorderRadius.circular(30), // More rounded corners
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: Color(0xFF008D23)), // Green text
                          ),
                        ),
                      ),
                      // Yes button with green background
                      Container(
                        width: 120,
                        height: 40, // Set the height of the container
                        decoration: BoxDecoration(
                          color: Color(0xFF008D23), // Green background
                          borderRadius:
                              BorderRadius.circular(30), // More rounded corners
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Save all items logic if "Yes" is clicked
                            print("Saved items: $_savedItems");
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.white), // White text
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0B553E),
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 130),
        ),
        child: Text(
          'Save item',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _expDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate); // Format the date
      });
    }
  }

  void _showEditQuantityDialog(String itemName) {
    // Variables to hold the new quantity, unit, and date
    int newQuantity = _quantity; // Initialize with the current quantity
    String newUnit = ''; // Variable to hold the weight/volume unit
    TextEditingController _dateAddedController =
        TextEditingController(); // Controller for Date Added

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Edit Quantity')),
          content: Container(
            width: 400, // Set the desired width for the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Quantity and Weight/Volume unit section
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Number:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                              height: 8), // Space between label and textbox
                          Container(
                            height: 60, // Set the height for the textbox
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                newQuantity = int.tryParse(value) ??
                                    1; // Parse the quantity
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: newQuantity.toString(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10), // Padding inside textbox
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5), // Space between two columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weight/Volume unit:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                              height: 8), // Space between label and textbox
                          Container(
                            height: 60, // Set the height for the textbox
                            child: TextField(
                              onChanged: (value) {
                                newUnit = value; // Capture the unit
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'e.g., kg, L',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10), // Padding inside textbox
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Space after the inputs
                // Date Added section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date Added:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8), // Space between label and textbox
                    Container(
                      height: 60.0,
                      child: TextField(
                        controller: _dateAddedController,
                        readOnly:
                            true, // Make it read-only to use a date picker
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              _dateAddedController.text =
                                  formattedDate; // Set the selected date
                            });
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select date',
                          suffixIcon: Icon(Icons.calendar_today),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Space before Save button
                // Centralized Save button with adjustable width
                Center(
                  child: Container(
                    width: 150, // Set the width of the Save button
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Colors.green, // Green background for Save button
                      ),
                      onPressed: () {
                        setState(() {
                          _quantity = newQuantity; // Update the quantity
                          // Optionally, store the unit and date in a data structure if needed
                          _savedItems[itemName] =
                              newQuantity; // Save the updated quantity
                        });
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white), // White text on Save button
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
