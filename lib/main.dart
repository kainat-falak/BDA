import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'services/firebase_service.dart';
import 'screens/seeker_profile.dart';
import 'screens/donor_seeker.dart';
import 'screens/splash_screen.dart'; // Optional

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const CheckUserStatus(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomeScreen(),
        '/seekerProfile': (context) => const SeekerProfilePage(),
        '/donorSeeker': (context) => const BloodSearchPage(),
        '/splash': (context) => const SplashScreen(), // Optional
      },
    );
  }
}

class CheckUserStatus extends StatefulWidget {
  const CheckUserStatus({super.key});

  @override
  _CheckUserStatusState createState() => _CheckUserStatusState();
}

class _CheckUserStatusState extends State<CheckUserStatus> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    bool isRegistered = prefs.getBool('isRegistered') ?? false;

    await Future.delayed(const Duration(milliseconds: 2000)); // 2 seconds

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (isRegistered) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
