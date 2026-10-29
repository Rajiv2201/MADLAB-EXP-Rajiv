// Experiment 3: Flutter UI using common widgets.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Common Flutter Widgets'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.indigo,
                  child: Icon(Icons.person, size: 55, color: Colors.white),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Welcome to Flutter',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This application demonstrates common widgets.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: const [
                        Icon(Icons.school, size: 40, color: Colors.indigo),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text('Flutter UI Design',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.indigo.shade50,
                  child: const Text('This is a Container widget.',
                      style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Button clicked successfully!'),
                      ),
                    );
                  },
                  child: const Text('Click Me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
