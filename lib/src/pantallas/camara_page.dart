import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CamaraPage extends StatefulWidget {
  const CamaraPage({super.key});

  @override
  State<CamaraPage> createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {
  File? _foto;

  Future tomarFoto() async {
    final picker = ImagePicker();
    final imagen = await picker.pickImage(source: ImageSource.camera);

    if (imagen != null) {
      setState(() => _foto = File(imagen.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tomar foto")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _foto == null
                ? const Text("No hay foto aún")
                : Image.file(_foto!, height: 300),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: tomarFoto,
              child: const Text("Tomar foto 📸"),
            ),
          ],
        ),
      ),
    );
  }
}
