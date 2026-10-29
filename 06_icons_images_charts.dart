// Experiment 6: Icons, network image and a simple bar chart.
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
          title: const Text('Icons, Images and Charts'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1. Icons',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, size: 45, color: Colors.blue),
                  Icon(Icons.favorite, size: 45, color: Colors.red),
                  Icon(Icons.star, size: 45, color: Colors.orange),
                  Icon(Icons.settings, size: 45, color: Colors.green),
                ],
              ),
              const SizedBox(height: 25),
              const Text('2. Image',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 100,
                  child: Center(child: Text('Image could not be loaded')),
                ),
              ),
              const SizedBox(height: 25),
              const Text('3. Monthly Sales Chart',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(
                height: 220,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _bar('Jan', 80, Colors.blue),
                    _bar('Feb', 130, Colors.green),
                    _bar('Mar', 170, Colors.orange),
                    _bar('Apr', 110, Colors.purple),
                    _bar('May', 190, Colors.red),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text('Monthly sales (illustrative values)'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _bar(String label, double height, Color color) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 35,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(6)),
            ),
          ),
          const SizedBox(height: 6),
          Text(label),
        ],
      );
}
