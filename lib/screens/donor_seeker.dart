import 'package:blood_donation_app/screens/register_screen.dart';
// import 'package:blood_donation_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BloodSearchApp());
}

class BloodSearchApp extends StatelessWidget {
  const BloodSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RegisterPage());
  }
}

class BloodSearchPage extends StatefulWidget {
  const BloodSearchPage({super.key});

  @override
  BloodSearchPageState createState() => BloodSearchPageState();
}

class BloodSearchPageState extends State<BloodSearchPage> {
  String selectedBloodGroup = '';
  String searchType = 'Donor'; // 'Donor' or 'Seeker'
  TextEditingController locationController = TextEditingController();

  final List<String> bloodGroups = ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('APP NAME', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [Icon(Icons.close, color: Colors.black), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.person, size: size.width * 0.2),
              ),
              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Blood Group',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8,
                children:
                    bloodGroups.map((group) {
                      bool isSelected = selectedBloodGroup == group;
                      return ChoiceChip(
                        label: Text(group),
                        selected: isSelected,
                        selectedColor: Colors.red,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          setState(() {
                            selectedBloodGroup = selected ? group : '';
                          });
                        },
                      );
                    }).toList(),
              ),
              SizedBox(height: 20),

              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'City/location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text('Donor'),
                    selected: searchType == 'Donor',
                    selectedColor: Colors.red,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color:
                          searchType == 'Donor' ? Colors.white : Colors.black,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        searchType = 'Donor';
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Blood Request'),
                    selected: searchType == 'Seeker',
                    selectedColor: Colors.red,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color:
                          searchType == 'Seeker' ? Colors.white : Colors.black,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        searchType = 'Seeker';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    print('Selected Blood Group: $selectedBloodGroup');
                    print('Location: ${locationController.text}');
                    print('Search Type: $searchType');
                  },
                  child: Text('Search', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bloodtype), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
        ],
      ),
    );
  }
}
