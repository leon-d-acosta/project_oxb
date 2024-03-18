// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class qrCodeView extends StatefulWidget {
  const qrCodeView({super.key});

  @override
  State<qrCodeView> createState() => _qrCodeViewState();
}
  String _scanResult = "";

class _qrCodeViewState extends State<qrCodeView> {
  Future<void> ScanCode() async {
    String barcodeScanRes;
    try{
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "Colors.red", "cancel", true, ScanMode.QR);

    } on PlatformException{
      barcodeScanRes = "Failed to scan";
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
            ElevatedButton(onPressed: ScanCode, child: Text("Scan"),),
            ],
        ),
      ),
    );
  }
}