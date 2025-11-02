import 'package:flutter/material.dart';

class Acercade extends StatelessWidget {
  const Acercade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acerca de"),
        backgroundColor: const Color(0xFFFF6666),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D0C2B), Color(0xFF3C1361), Color(0xFF6D1B7B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.book, size: 80, color: Colors.white),
              SizedBox(height: 20),
              Text(
                "Mi Diario Personal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Versión 1.0\nDesarrollado con ❤️ por Jessi",
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
