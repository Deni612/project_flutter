import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
      appBar: AppBar(
        title: Text("Frhnnnnnnnnnn App"),
      ),// AppBar
      body: ListView(
       children:[
        ListTile(
          title: Text("Amir"),
          subtitle: Text("Selamat Pagi"),
          leading: CircleAvatar(),
          trailing: Text("10:00 AM"),
        ),
       ],
      )
     ),
     );
  
  }
}