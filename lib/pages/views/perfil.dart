// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class perfilView extends StatefulWidget {
  const perfilView({super.key});

  @override
  State<perfilView> createState() => _perfilViewState();
}

class _perfilViewState extends State<perfilView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Meu perfil", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}