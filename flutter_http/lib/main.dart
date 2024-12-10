import 'package:flutter/material.dart';
import 'package:flutter_http/models/http_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
//import './models/http_provider.dart';
import './pages/home_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HttpProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeProvider(),
      ),
    );
  }
}
