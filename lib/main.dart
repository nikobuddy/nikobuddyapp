import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modern UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow), // Optional: Match the seed color with your app theme
        useMaterial3: true, // Enable Material 3 design system
      ),
      home:  HomePage(), // Starting point of the app
    );
  }
}
