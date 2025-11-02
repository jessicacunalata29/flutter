import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: const Color(0xFF3C1361),
        elevation: 8,
        shadowColor: Colors.pinkAccent,
      ),
      body: Stack(
        children: [
          // Contenido principal
          ListView(
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
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),

              _tarjetaAccion(
                context,
                icon: Icons.edit,
                texto: "Escribe un nuevo pensamiento",
                colores: [Color(0xFFFF6666), Color(0xFFFFB6C1)],
                mensajeSnack: "🪷 ¡Aquí puedes escribir un nuevo apunte!",
              ),
              _tarjetaAccion(
                context,
                icon: Icons.menu_book,
                texto: "Tus reflexiones recientes",
                colores: [Color(0xFF3C1361), Color(0xFF6D1B7B)],
                mensajeSnack: "📖 Aquí puedes ver tus reflexiones recientes",
              ),
              _tarjetaAccion(
                context,
                icon: Icons.favorite,
                texto: "Tus favoritos guardados",
                colores: [Color(0xFF0D0C2B), Color(0xFF3C1361)],
                mensajeSnack: "💖 Aquí puedes ver tus favoritos",
              ),
              const SizedBox(height: 80), // Para dejar espacio al botón
            ],
          ),

          // Botón de Atrás en la parte inferior
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFFF6666),
                onPressed: () {
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
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
    required String mensajeSnack,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(mensajeSnack)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colores,
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
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(
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
