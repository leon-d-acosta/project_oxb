// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/pages/register.dart';
import 'pages/homepage.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login(),
      routes: {
        '/login': (context) => login(),
        '/register': (context) => registerPage(),
        '/homepage': (context) => homePage()
      },
    );
  }
}
