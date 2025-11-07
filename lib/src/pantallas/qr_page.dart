import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key}); // ✅ Constructor con key

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrData = "Esperando escaneo...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escanear QR")),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (ctrl) {
                controller = ctrl;
                ctrl.scannedDataStream.listen((scan) {
                  setState(() => qrData = scan.code);
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Resultado: $qrData",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose(); // ✅ liberar la cámara
    super.dispose();
  }
}
