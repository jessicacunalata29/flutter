import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String resultado = "Escanea un QR para obtener frase ✨";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escanear QR")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (c) {
                controller = c;
                c.scannedDataStream.listen((scan) {
                  setState(() => resultado = scan.code ?? "");
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(resultado, style: const TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
