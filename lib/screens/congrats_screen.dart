import 'package:flutter/material.dart';

class DonationSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to update/cancel page
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWideScreen ? 400 : double.infinity),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Success Message
                    Text(
                      "SUCCESSFUL\nBLOOD\nDONATION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "CONGRATS",
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24),
                    // View Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.red),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BloodDonationHistoryPage(),
                          ),
                        );
                      },
                      child: Text(
                        "VIEW",
                        style: TextStyle(
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy history page
class BloodDonationHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "Your Blood Donation History",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
