// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class minhasTarefasView extends StatefulWidget {
  const minhasTarefasView({super.key});

  @override
  State<minhasTarefasView> createState() => _minhasTarefasViewState();
}

class _minhasTarefasViewState extends State<minhasTarefasView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Minhas tarefas", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}