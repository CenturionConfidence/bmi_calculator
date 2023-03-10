import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0a0d22),
          elevation: 5,
        ),
        scaffoldBackgroundColor: const Color(0xFF0a0d22),
      ),
      home: const HomePage(),
    );
  }
}
