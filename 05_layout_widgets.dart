// Experiment 5: Layout using Row, Column, Expanded, Container and ListView.
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
          title: const Text('Flutter Layout Widgets'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text('Container Widget',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Row Layout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _box('One', Colors.red.shade200)),
                  const SizedBox(width: 10),
                  Expanded(child: _box('Two', Colors.green.shade200)),
                  const SizedBox(width: 10),
                  Expanded(child: _box('Three', Colors.blue.shade200)),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Column and List Layout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = 1; i <= 5; i++)
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.widgets,
                              color: Colors.deepPurple),
                          title: Text('Layout Item $i'),
                          subtitle: const Text('Created using ListTile and Card'),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _box(String label, Color color) => Container(
        height: 70,
        color: color,
        child: Center(child: Text(label)),
      );
}
