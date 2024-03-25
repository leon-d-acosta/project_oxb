// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/homepage': (context) => HomePage(),
      },
    );
  }
}
