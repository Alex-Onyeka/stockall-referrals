import 'package:flutter/material.dart';
import 'package:stockallref/pages/barcode_scanner.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  void openScanner(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const BarcodeScanner(),
      ),
    );

    if (result != null) {
      // Do something with the scanned result
      print('Scanned value: $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            openScanner(context);
          },
        ),
      ),
    );
  }
}
