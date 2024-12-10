import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void runApp(MyApp myApp) {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Images Widget"),
        ),
        body: Center(
          child: Container(
            // Menggunakan padding agar gambar tidak terlalu menempel ke tepi
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width * 0.8, // Responsif, menggunakan 80% dari lebar layar
            height: MediaQuery.of(context).size.width * 0.8, // Responsif, menggunakan 80% dari lebar layar
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 255, 139),
              borderRadius: BorderRadius.circular(15), // Menambahkan border radius yang lebih besar
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Memastikan sudut gambar juga melengkung
              child: Image.network(
                "https://picsum.photos/350/500", // Menggunakan Image.network untuk gambar dari URL
                fit: BoxFit.cover, // Agar gambar tetap proporsional dan mengisi area dengan baik
              ),
            ),
          ),
        ),
      ),
    );
  }
}
