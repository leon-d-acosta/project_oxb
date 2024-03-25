// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DadosRotaView extends StatefulWidget {
  const DadosRotaView({Key? key});

  @override
  State<DadosRotaView> createState() => _DadosRotaViewState();
}

class _DadosRotaViewState extends State<DadosRotaView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dados rota",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}