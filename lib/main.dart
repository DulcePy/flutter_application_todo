import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_todo/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo',
      home: Home(),
    );
  }
}



