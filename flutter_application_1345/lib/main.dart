import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App', // Menambahkan judul aplikasi
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'), // Menambahkan AppBar
        ),
        body: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(fontSize: 24), // Menambahkan ukuran font
          ),
        ),
      ),
    );
  }
}