import 'package:flutter/material.dart';
import 'package:firstapp/dashboard.dart';
import 'package:firstapp/grocerylistpage.dart';
import 'package:firstapp/mealplannerpage.dart';
import 'package:intl/intl.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<Map<String, String>> _inventoryItems = [];

  void _navigateToAddItemPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemPage()),
    );

    if (result != null) {
      setState(() {
        _inventoryItems.add(result); // Add new item to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Inventory',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B553E),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _customSizedButton(context, 'Pantry', 40, () {}),
              _customSizedButton(context, 'Fridge', 40, () {}),
              _customSizedButton(context, 'Freezer', 40, () {}),
            ],
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Item', style: TextStyle(color: Colors.white)),
                Text('Storage', style: TextStyle(color: Colors.white)),
                Text('Quantity', style: TextStyle(color: Colors.white)),
                Text('Exp. Date', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: _inventoryItems.isEmpty
                ? Center(child: Text('No items to show'))
                : Container(
                    color: Colors.grey[300],
                    child: ListView.builder(
                      itemCount: _inventoryItems.length,
                      itemBuilder: (context, index) {
                        final item = _inventoryItems[index];
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Text(item['name'] ?? '',
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text(item['storage'] ?? '',
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text(item['quantity'] ?? '',
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text(item['expDate'] ?? '',
                                      textAlign: TextAlign.center)),
                            ],
                          ),
                        );
                      },
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
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddItemPage,
        child: Icon(Icons.add, size: 32),
        backgroundColor: Color(0xFF0B553E),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _customSizedButton(BuildContext context, String label,
      double buttonHeight, VoidCallback onPressed) {
    return SizedBox(
      width: 120,
      height: buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: buttonHeight * 0.35,
          ),
        ),
      ),
    );
  }
}

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

String? _selectedUnit;

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
        _buildTextFieldLabel1('Item Name'),
        SizedBox(height: 10),
        _buildTextField('Enter item name'),
        SizedBox(height: 10),
        _buildTextFieldLabel2('Storage'),
        SizedBox(height: 1),
        _buildStorageButtons(),
        SizedBox(height: 20),
        _buildTextFieldLabel3(
            'Quantity                               Weight/Volume Unit'),
        SizedBox(height: 10),
        _buildQuantityControl(),
        SizedBox(height: 20),
        _buildTextFieldLabel4('Expiration Date'),
        SizedBox(height: 10),
        _buildDateField(),
        SizedBox(height: 20),
        _buildTextFieldLabel5('Category'),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTextFieldLabel1(String label) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextFieldLabel2(String label) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextFieldLabel3(String label) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
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

  Widget _buildTextFieldLabel4(String label) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  String? _selectedCategory;
  Widget _buildTextFieldLabel5(String label) {
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

  Widget _buildStorageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _storageButton('Pantry', 120, 30),
        _storageButton('Freezer', 120, 30),
        _storageButton('Fridge', 120, 30),
      ],
    );
  }

  Widget _storageButton(String label, double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0B553E),
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

  Widget _buildDateField() {
    return Container(
      height: 70.0,
      child: TextField(
        controller: _expDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Select expiration date',
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ),
      ),
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
          // Save all items logic
          print("Saved items: $_savedItems");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0B553E),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        child: Text(
          'Add to inventory',
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
