import 'package:flutter/material.dart';

class rotaView extends StatefulWidget {
  const rotaView({super.key});

  @override
  State<rotaView> createState() => _rotaViewState();
}

class _rotaViewState extends State<rotaView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Rota", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}