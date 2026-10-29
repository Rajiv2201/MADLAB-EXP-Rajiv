// Experiment 8: Save and read a text file in the app documents directory.
// Dependency: flutter pub add path_provider
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FilePage(),
      );
}

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = 'Enter text and save it to a file.';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/sample.txt');
  }

  Future<void> _saveFile() async {
    try {
      final file = await _getFile();
      await file.writeAsString(_controller.text);
      if (!mounted) return;
      setState(() => _result = 'File saved successfully!');
    } catch (e) {
      if (!mounted) return;
      setState(() => _result = 'Error saving file: $e');
    }
  }

  Future<void> _readFile() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) {
        if (!mounted) return;
        setState(() => _result = 'File does not exist. Save some text first.');
        return;
      }
      final contents = await file.readAsString();
      if (!mounted) return;
      setState(() => _result = 'File contents:\n$contents');
    } catch (e) {
      if (!mounted) return;
      setState(() => _result = 'Error reading file: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('File Handling'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveFile,
                      child: const Text('Save File'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _readFile,
                      child: const Text('Read File'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Output:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              const SizedBox(height: 10),
              SelectableText(_result),
            ],
          ),
        ),
      );
}
