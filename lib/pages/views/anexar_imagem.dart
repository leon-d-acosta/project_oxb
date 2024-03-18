import 'package:flutter/material.dart';

class anexarImagemView extends StatefulWidget {
  const anexarImagemView({super.key});

  @override
  State<anexarImagemView> createState() => _anexarImagemViewState();
}

class _anexarImagemViewState extends State<anexarImagemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anexar imagem", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}