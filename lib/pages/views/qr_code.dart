// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({Key? key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  String _scanResult = "";

  Future<void> _scanCode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Color de la barra superior de escaneo
        "Cancelar", // Texto del botón de cancelar
        true, // Modo de escaneo: QR, Barcode o ambos
        ScanMode.QR, // Modo de escaneo (QR, Barcode)
      );
    } on PlatformException {
      barcodeScanRes = "Fallo al escanear";
    }
    setState(() {
      _scanResult = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _scanCode,
              child: Text("Escanear"),
            ),
            Text(_scanResult),
          ],
        ),
      ),
    );
  }
}
