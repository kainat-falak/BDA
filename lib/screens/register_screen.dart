import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static Map<String, String> registeredUsers =
      {};

  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _errorMessage = '';

  void _register() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = "All fields are required.";
      });
      return;
    }

    if (RegisterPage.registeredUsers.containsKey(username)) {
      setState(() {
        _errorMessage = "Username already exists.";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = "Passwords do not match.";
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        _errorMessage = "Password must be at least 6 characters.";
      });
      return;
    }

    RegisterPage.registeredUsers[username] = password;
    setState(() {
      _errorMessage = "Registration Successful!";
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login'); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/heart_img.png', width: 100),
            SizedBox(height: 20),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),

            if (_errorMessage.isNotEmpty) ...[
              SizedBox(height: 10),
              Text(_errorMessage, style: TextStyle(color: Colors.red)),
            ],

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'REGISTER',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
