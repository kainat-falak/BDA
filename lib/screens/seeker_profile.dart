import 'package:flutter/material.dart';

void main() {
  runApp(SeekerProfileApp());
}

class SeekerProfileApp extends StatelessWidget {
  const SeekerProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeekerProfilePage(),
    );
  }
}

class SeekerProfilePage extends StatefulWidget {
  const SeekerProfilePage({super.key});

  @override
  SeekerProfilePageState createState() => SeekerProfilePageState();
}

class SeekerProfilePageState extends State<SeekerProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String urgency = 'Urgent';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                'Blood Request',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  customTextField('Name', nameController),
                  SizedBox(height: 10),
                  customTextField(
                    'Age',
                    ageController,
                    inputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  customTextField('Blood Type', bloodTypeController),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: customTextField('Location', locationController),
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Add from Google Map',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  customTextField('Reason', reasonController),
                  SizedBox(height: 10),
                  customTextField(
                    'Amount',
                    amountController,
                    inputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),

                  // Urgency Toggle
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              urgency = 'Urgent';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color:
                                  urgency == 'Urgent'
                                      ? Colors.red
                                      : Colors.white,
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Urgent',
                              style: TextStyle(
                                color:
                                    urgency == 'Urgent'
                                        ? Colors.white
                                        : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              urgency = 'Within Days';
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color:
                                  urgency == 'Within Days'
                                      ? Colors.red
                                      : Colors.white,
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Within Days',
                              style: TextStyle(
                                color:
                                    urgency == 'Within Days'
                                        ? Colors.white
                                        : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Upload ID Card (PDF)
                  Row(
                    children: [
                      Expanded(
                        child: customTextField(
                          'ID-Card',
                          TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          // Implement file picker here
                        },
                        child: Text(
                          'Upload PDF',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Description
                  customTextField(
                    'Description',
                    descriptionController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(height: size.height * 0.1, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget customTextField(
    String hint,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
