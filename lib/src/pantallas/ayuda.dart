import 'package:flutter/material.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayuda"),
        backgroundColor: const Color(0xFFFF6666),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3C1361), Color(0xFF6D1B7B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _pregunta(
              "¿Cómo escribir un apunte?",
              "Pulsa 'Escribir un nuevo pensamiento'.",
            ),
            _pregunta(
              "¿Cómo ver favoritos?",
              "Ve a la sección 'Favoritos' desde el menú lateral.",
            ),
            _pregunta(
              "¿Cómo cambiar configuraciones?",
              "Entra a 'Configuración' y ajusta tus preferencias.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _pregunta(String titulo, String respuesta) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6666), Color(0xFFFFB6C1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.pinkAccent,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            respuesta,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
