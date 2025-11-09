import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:flutter/rendering.dart';

class FrasesQRPage extends StatefulWidget {
  const FrasesQRPage({super.key});

  @override
  State<FrasesQRPage> createState() => _FrasesQRPageState();
}

class _FrasesQRPageState extends State<FrasesQRPage> {
  final Map<String, String> frases = {
    "Cree en ti y todo será posible ✨":
        "Cree en ti, porque cada paso que das te acerca a tus sueños. La confianza en ti mismo es la base para lograr grandes cosas.",
    "Un día a la vez 🌿":
        "Toma cada día como una nueva oportunidad para mejorar y crecer. La vida no se vive toda a la vez, sino paso a paso.",
    "Tu historia recién empieza 📖":
        "Nunca es tarde para comenzar de nuevo. Tu historia está llena de capítulos por escribir, y lo mejor aún está por llegar.",
    "Lo que sueñas, lo logras 💫":
        "Los sueños son el inicio de las grandes realidades. Trabaja con pasión y dedicación, y verás cómo tus metas se hacen posibles.",
    "Eres más fuerte de lo que crees 💜":
        "En los momentos difíciles es donde descubres tu verdadera fuerza. Nunca subestimes tu capacidad para superar retos.",
  };

  String? fraseActual;

  final GlobalKey qrKey = GlobalKey();

  Future<void> _guardarQR() async {
    try {
      RenderRepaintBoundary boundary =
          qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final filePath = "${directory.path}/qr_image.png";
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      await GallerySaver.saveImage(file.path);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ QR guardado en tu galería")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Error al guardar: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases QR"),
        backgroundColor: const Color(0xFF3C1361),
      ),
      backgroundColor: const Color(0xFF0D0C2B),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Selecciona una frase para generar tu QR 🌟",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            DropdownButton<String>(
              hint: const Text(
                "Elige una frase",
                style: TextStyle(color: Colors.white),
              ),
              value: fraseActual,
              dropdownColor: const Color(0xFF3C1361),
              items: frases.keys.map((String frase) {
                return DropdownMenuItem(
                  value: frase,
                  child: Text(
                    frase,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => fraseActual = value);
              },
            ),
            const SizedBox(height: 30),

            if (fraseActual != null) ...[
              RepaintBoundary(
                key: qrKey,
                child: QrImageView(
                  data: frases[fraseActual]!,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),

              Text(
                fraseActual!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: _guardarQR,
                icon: const Icon(Icons.save),
                label: const Text("Guardar QR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3C1361),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
