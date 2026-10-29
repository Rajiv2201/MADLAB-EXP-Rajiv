// Experiment 1: Install and configure Flutter environment.
// Run this as lib/main.dart in a Flutter project.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Flutter Environment Configured Successfully!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
