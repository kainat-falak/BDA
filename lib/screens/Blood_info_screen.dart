import 'package:flutter/material.dart';

class BloodSearchPage extends StatefulWidget {
  @override
  _BloodSearchPageState createState() => _BloodSearchPageState();
}

class _BloodSearchPageState extends State<BloodSearchPage> {
  String? selectedBloodGroup;
  bool isDonor = true; // default to Donor

  List<String> bloodGroups = [
    "A+", "B+", "AB+", "O+", "A-", "B-", "AB-", "O-"
  ];

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWideScreen ? 500 : double.infinity),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Donor/Seeker profile image placeholder
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 24),

                  // Blood group selection
                  Text(
                    "Select Blood Group",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: bloodGroups.map((bg) {
                      bool isSelected = selectedBloodGroup == bg;
                      return ChoiceChip(
                        label: Text(bg),
                        selected: isSelected,
                        onSelected: (_) => setState(() => selectedBloodGroup = bg),
                        selectedColor: Colors.red,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: isSelected ? Colors.red : Colors.black54,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),

                  // City/location input
                  TextField(
                    decoration: InputDecoration(
                      labelText: "City / Location",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Search type
                  Text(
                    "Search Type",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: Text("Donor"),
                    value: isDonor,
                    onChanged: (val) => setState(() => isDonor = val),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.bloodtype),
                  ),
                  SwitchListTile(
                    title: Text("Seeker"),
                    value: !isDonor,
                    onChanged: (val) => setState(() => isDonor = !val),
                    activeColor: Colors.red,
                    secondary: Icon(Icons.person_search),
                  ),
                  SizedBox(height: 24),

                  // Search button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Implement search logic here
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

