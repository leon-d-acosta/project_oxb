import 'package:flutter/material.dart';

class qrCodeView extends StatefulWidget {
  const qrCodeView({super.key});

  @override
  State<qrCodeView> createState() => _qrCodeViewState();
}

class _qrCodeViewState extends State<qrCodeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("QR Code", style: TextStyle(color: Colors.white),)
            ],
        ),
      ),
    );
  }
}