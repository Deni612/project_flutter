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
     debugShowCheckedModeBanner: false,
     home: Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),// AppBar
      body: ListView(
        scrollDirection: Axis.horizontal,
       children:[
        Container(
          width: 400,
          height: 400,
          color: Colors.green,
        ),
        Container(
          width: 400,
          height: 400,
          color: Colors.red,
        ),
         Container(
          width: 400,
          height: 400,
          color: const Color.fromARGB(255, 133, 54, 244),
        ),
       ],
      )
     ),
     );
  
  }
}