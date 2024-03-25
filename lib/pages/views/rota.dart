import 'package:flutter/material.dart';

class RotaView extends StatefulWidget {
  const RotaView({Key? key});

  @override
  State<RotaView> createState() => _RotaViewState();
}

class _RotaViewState extends State<RotaView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rota",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
