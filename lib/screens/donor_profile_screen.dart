import 'package:flutter/material.dart';

class DonorDashboardPage extends StatefulWidget {
  @override
  _DonorDashboardPageState createState() => _DonorDashboardPageState();
}

class _DonorDashboardPageState extends State<DonorDashboardPage> {
  bool isDonorActive = true;

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              // show location or trigger GPS
            },
          )
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isWideScreen ? 500 : double.infinity),
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              // Welcome and Profile Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome,", style: TextStyle(fontSize: 16)),
                      Text("Areeb Fatima", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.png'), // replace with your asset or network image
                  )
                ],
              ),
              SizedBox(height: 16),

              // Donor Mode Switch
              SwitchListTile(
                title: Text("Donor Mode"),
                subtitle: Text(isDonorActive ? "Active" : "Inactive"),
                value: isDonorActive,
                activeColor: Colors.red,
                onChanged: (val) => setState(() => isDonorActive = val),
              ),
              SizedBox(height: 8),

              // Donor Info
              Card(
                color: Colors.red[50],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.red),
                  title: Text("Blood Group: O+"),
                  subtitle: Text("Last Donation: 3 months ago\nCity: Lahore"),
                ),
              ),
              SizedBox(height: 12),

              // Update Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  // Navigate to update info form
                },
                child: Text("Update My Information", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 20),

              // General Options
              Text("General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),

              buildOptionTile(Icons.person, "My Profile", "Edit your personal info"),
              buildOptionTile(Icons.share, "Share App", "Invite friends to join"),
              buildOptionTile(Icons.star_rate, "Rate App", "Let us know what you think"),
              buildOptionTile(Icons.feedback, "Feedback & Suggestions", "Help us improve"),
              buildOptionTile(Icons.privacy_tip, "Privacy", "Read our privacy policy"),

              SizedBox(height: 24),

              // Logout Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Logout logic
                },
                child: Text("Logout", style: TextStyle(fontSize: 18, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to respective screen
        },
      ),
    );
  }
}
