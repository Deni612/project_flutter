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
      body: Center(
       child: Text("aku mau ",
       //maxLines: 2,
       //overflow: TextOverflow.ellipsis,
       style:TextStyle(
        backgroundColor: Colors.amber,
        color: Colors.white,
        fontSize:30 
      ),),
     ),
     ),
     );
  }
}