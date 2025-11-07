import 'package:flutter/material.dart';
import 'package:ejemplo/src/pantallas/camara_page.dart';
import 'package:ejemplo/src/pantallas/gps_page.dart';
import 'package:ejemplo/src/pantallas/qr_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Color(0xFF3C1361),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),

          const Center(
            child: Text(
              "🌌 Tu Diario Personal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Explora tus pensamientos, reflexiona y registra cada día 🌙",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),

          _tarjetaAccion(
            context,
            icon: Icons.edit,
            texto: "Nuevo pensamiento",
            colores: [Color(0xFFFF6666), Color(0xFFFFB6C1)],
            onTap: () {},
          ),

          _tarjetaAccion(
            context,
            icon: Icons.photo_camera,
            texto: "Guardar recuerdo con foto 📸",
            colores: [Color(0xFF6D1B7B), Color(0xFF3C1361)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CamaraPage()),
              );
            },
          ),

          _tarjetaAccion(
            context,
            icon: Icons.location_on,
            texto: "Registrar ubicación del día 📍",
            colores: [Color(0xFF0D0C2B), Color(0xFF3C1361)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QrPage()),
              );
            },
          ),

          _tarjetaAccion(
            context,
            icon: Icons.qr_code_scanner,
            texto: "Escanear frase motivacional QR ✨",
            colores: [Color(0xFFFF6666), Color(0xFFFFB6C1)],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QRPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFF0D0C2B),
    );
  }

  Widget _tarjetaAccion(
    BuildContext context, {
    required IconData icon,
    required String texto,
    required List<Color> colores,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colores),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                texto,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
