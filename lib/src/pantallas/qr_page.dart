import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  MobileScannerController controller = MobileScannerController();
  String? qrData = "Esperando escaneo...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear QR"),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: controller,
              onDetect: (capture) {
                final barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  setState(() {
                    qrData = barcode.rawValue ?? "No detectado";
                  });
                }
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
    controller.dispose(); // ✅ liberar cámara
    super.dispose();
  }
}
