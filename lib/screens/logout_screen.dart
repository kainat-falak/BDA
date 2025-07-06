import 'package:flutter/material.dart';

void main() {
  runApp(const LogoutConfirmationApp());
}

class LogoutConfirmationApp extends StatelessWidget {
  const LogoutConfirmationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Red X icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red),
              ),
              child: const Icon(Icons.close, color: Colors.red, size: 40),
            ),
            const SizedBox(height: 20),

            // Confirmation text
            const Text(
              'Are you sure you want to',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Text(
              'log out ?',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle logout
                  Navigator.of(context).pop();
                },
                child: const Text("Logout", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 10),

            // Cancel button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black12),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Cancel", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP NAME'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showLogoutDialog(context),
          child: const Text("Logout"),
        ),
      ),
    );
  }
}