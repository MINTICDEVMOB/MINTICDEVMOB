import 'package:flutter/material.dart';
import 'package:sprint2/pages/splashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Punto de interés',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: const SplashPage(),
    );
  }
}

