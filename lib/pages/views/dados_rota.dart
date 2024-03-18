// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class dadosRotaView extends StatefulWidget {
  const dadosRotaView({super.key});

  @override
  State<dadosRotaView> createState() => _dadosRotaViewState();
}

class _dadosRotaViewState extends State<dadosRotaView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dados rota", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}