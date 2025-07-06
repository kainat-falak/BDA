import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "All fields are required.";
      });
      return;
    }

    if (RegisterPage.registeredUsers.containsKey(username) &&
        RegisterPage.registeredUsers[username] == password) {
      setState(() {
        _errorMessage = "Login Successful!";
      });

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      setState(() {
        _errorMessage = "Invalid username or password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/heart_img.png', width: 80),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),

                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  if (_errorMessage.isNotEmpty) ...[
                    Text(_errorMessage, style: TextStyle(color: Colors.red)),
                    SizedBox(height: 10),
                  ],

                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Don't have an account? Register now",
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
