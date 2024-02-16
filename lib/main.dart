import 'package:flutter/material.dart';
import 'package:lorby_auth/utils/routes.dart';

void main() {
  runApp(const LorbyApp());
}

class LorbyApp extends StatelessWidget {
  const LorbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
