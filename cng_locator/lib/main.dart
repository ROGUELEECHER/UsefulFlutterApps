import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(CNGLocatorApp());
}

class CNGLocatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNG Locator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
