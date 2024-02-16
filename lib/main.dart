import 'package:flutter/material.dart';
import 'screens/confirm_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const LorbyApp());
}

class LorbyApp extends StatelessWidget {
  const LorbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LogInScreen(),
        "/home": (context) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
        "/confirm": (context) => const ConfirmScreen(),
      },
    );
  }
}
