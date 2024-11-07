import 'package:flutter/material.dart';
import 'package:archipanion/EntrancePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EntrancePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
        ).copyWith(
          secondary: Colors.deepPurpleAccent, // Replaces the deprecated accentColor
        ),
      ),
    );
  }
}