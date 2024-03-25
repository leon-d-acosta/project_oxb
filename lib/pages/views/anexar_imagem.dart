import 'package:flutter/material.dart';

class AnexarImagemView extends StatefulWidget {
  const AnexarImagemView({Key? key});

  @override
  State<AnexarImagemView> createState() => _AnexarImagemViewState();
}

class _AnexarImagemViewState extends State<AnexarImagemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Anexar imagen",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}