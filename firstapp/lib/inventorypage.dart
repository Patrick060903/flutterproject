import 'package:flutter/material.dart';
import 'package:firstapp/dashboard.dart';
import 'package:firstapp/grocerylistpage.dart';
import 'package:firstapp/mealplannerpage.dart';
import 'package:intl/intl.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<Map<String, String>> _inventoryItems = [];

  void _navigateToAddItemPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItemPage()),
    );

    if (result != null) {
      setState(() {
        _inventoryItems.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
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
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _customSizedButton(context, 'Pantry', 40, () {}),
              _customSizedButton(context, 'Fridge', 40, () {}),
              _customSizedButton(context, 'Freezer', 40, () {}),
            ],
          ),
          const SizedBox(height: 15), // Adjust the height as needed
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0), // Adjust horizontal padding as needed
            child: Row(
              children: [
                Icon(
                  Icons.filter_list, // Filter icon
                  size: 24, // Adjust icon size as needed
                ),
                SizedBox(width: 8), // Space between icon and text
                Text(
                  'Item Filters',
                  style: TextStyle(
                    fontSize: 15, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
                Spacer(), // Pushes the sort section to the right
                Row(
                  children: [
                    SizedBox(
                        width: 8), // Space between text and first sort icon
                    Icon(
                      Icons.sort, // First sort icon
                      size: 24, // Adjust icon size as needed
                    ),
                    Text(
                      'Sort By:',
                      style: TextStyle(
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),

                    SizedBox(
                        width: 50), // Space between first and second sort icon
                    Icon(
                      Icons.grid_4x4, // Second sort icon
                      size: 24, // Adjust icon size as needed
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Item', style: TextStyle(color: Colors.white)),
                Text('Storage', style: TextStyle(color: Colors.white)),
                Text('Quantity', style: TextStyle(color: Colors.white)),
                Text('Exp. Date', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _inventoryItems.isEmpty
                ? const Center(
                    child: Text(
                      'No items to show',
                      style: TextStyle(
                          color: Color(0xFF0B553E)), // Green color for the text
                    ),
                  )
                : Container(
                    color: Colors.grey[300],
                    child: ListView.builder(
                      itemCount: _inventoryItems.length,
                      itemBuilder: (context, index) {
                        final item = _inventoryItems[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
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
                  MaterialPageRoute(
                      builder: (context) => const DashboardPage()),
                );
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryPage()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryListPage()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MealPlannerPage()),
                );
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
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddItemPage,
        backgroundColor: const Color(0xFF0B553E),
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 32),
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
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
  const AddItemPage({super.key});

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
  final TextEditingController _expDateController = TextEditingController();
  final Map<String, int> _savedItems = {};
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
          child: const Text(
            'Add Items',
            style: TextStyle(
              color: Color(0xFF0B553E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              const SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _oblongButton('Text Search', 180, 30, () {
                    setState(() {
                      _selectedOption = 'search';
                    });
                  }, _selectedOption == 'search'),
                  const SizedBox(width: 10),
                  _oblongButton('Manual', 180, 30, () {
                    setState(() {
                      _selectedOption = 'manual';
                    });
                  }, _selectedOption == 'manual'),
                ],
              ),
              const SizedBox(height: 10),
              _selectedOption == 'search'
                  ? _buildSearchContent()
                  : _buildManualContent(),
              const SizedBox(height: 5),
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
          backgroundColor: isSelected ? const Color(0xFF0B553E) : Colors.white,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : const Color(0xFF0B553E),
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
        SizedBox(
          width: 390,
          height: 45,
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
              prefixIcon: const Icon(Icons.search),
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        _buildRectangleBoxes(),
      ],
    );
  }

  Widget _buildManualContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextFieldLabel1('Item Name'),
        const SizedBox(height: 10),
        _buildTextField('Enter item name'),
        const SizedBox(height: 10),
        _buildTextFieldLabel2('Storage'),
        const SizedBox(height: 1),
        _buildStorageButtons(),
        const SizedBox(height: 20),
        _buildTextFieldLabel3(
            'Quantity                               Weight/Volume Unit'),
        const SizedBox(height: 10),
        _buildQuantityControl(),
        const SizedBox(height: 20),
        _buildTextFieldLabel4('Expiration Date'),
        const SizedBox(height: 10),
        _buildDateField(),
        const SizedBox(height: 20),
        _buildTextFieldLabel5('Category'),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTextFieldLabel1(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextFieldLabel2(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextFieldLabel3(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildTextField1(String hint) {
    return SizedBox(
      height: 70.0,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return SizedBox(
      height: 70.0,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }

  Widget _buildTextFieldLabel4(String label) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  String? _selectedCategory;
  Widget _buildTextFieldLabel5(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
          hint: const Text('Select category'),
          value: _selectedCategory,
          items: <String>['vegetable', 'fruits', 'meat'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
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
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0B553E),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF008D23),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove, color: Colors.white),
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

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Text(
            '$_quantity',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Add button
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF008D23),
          ),
          child: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                hint: const Text('Select unit'),
                value: _selectedUnit,
                items: <String>['pieces', 'kg', 'grams'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUnit = newValue;
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
    return SizedBox(
      height: 70.0,
      child: TextField(
        controller: _expDateController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Select expiration date',
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
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
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: const Text(
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
    bool isSaved = _savedItems.containsKey(text);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSaved) {
            _savedItems.remove(text);
          } else {
            _showEditQuantityDialog(text);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 80,
        decoration: BoxDecoration(
          color: isSaved ? Colors.green[100] : Colors.white,
          border: Border.all(color: const Color(0xFF0B553E)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItemDetail(text),
            _buildItemDetail('Storage'),
            _buildItemDetail('Quantity: ${_savedItems[text] ?? 1}'),
            _buildItemDetail('Expiry Date'),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDetail(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, color: Color(0xFF0B553E)),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          print("Saved items: $_savedItems");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0B553E),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        child: const Text(
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
        _expDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _showEditQuantityDialog(String itemName) {
    int newQuantity = _quantity;
    String newUnit = '';
    String selectedUnit = 'kg'; // Default selected value

    TextEditingController dateAddedController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Edit Quantity',
              style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
            ),
          ),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Number',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Container(
                            width: 100, // Set your desired width here
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  newQuantity = int.tryParse(value) ?? 1;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: newQuantity.toString(),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Weight/Volume unit',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    onChanged: (value) {
                                      newUnit = value;
                                    },
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: 'e.g., kg, L',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10),
                                      suffixIcon: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value:
                                              selectedUnit, // Store selected value in a variable
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedUnit =
                                                  newValue!; // Update the selected value
                                            });
                                          },
                                          items: <String>[
                                            'kg',
                                            'L'
                                          ] // Add more units as needed
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          icon: const Icon(Icons
                                              .arrow_drop_down), // Dropdown icon
                                          // Ensure the dropdown appears below the text field
                                          isExpanded:
                                              true, // Ensures the dropdown expands to full width
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
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Date Added',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 60.0,
                      child: TextField(
                        controller: dateAddedController,
                        readOnly: true,
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
                              dateAddedController.text = formattedDate;
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Date',
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF0B553E)),
                      onPressed: () {
                        setState(() {
                          _quantity = newQuantity;

                          _savedItems[itemName] = newQuantity;
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
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
