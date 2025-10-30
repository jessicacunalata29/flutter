import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context), // 👈 Menú lateral
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7043),
        elevation: 0,
        title: const Text(
          "Mi Diario Personal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Módulos",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D4037),
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(context, Icons.edit_note, "NUEVA ENTRADA", "/nueva"),
            _buildMenuItem(context, Icons.book, "MIS ENTRADAS", "/entradas"),
            _buildMenuItem(
              context,
              Icons.bar_chart,
              "RESUMEN EMOCIONAL",
              "/resumen",
            ),
            _buildMenuItem(context, Icons.settings, "CONFIGURACIÓN", "/config"),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[700], size: 26),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Drawer (menú lateral)
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFFFF7043)),
            accountName: const Text(
              "Jessica Cunalata",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("Estudiante"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("imagen/diario.png"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit_note),
            title: const Text("Nueva entrada"),
            onTap: () => Navigator.pushNamed(context, "/nueva"),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Mis entradas"),
            onTap: () => Navigator.pushNamed(context, "/entradas"),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("Resumen emocional"),
            onTap: () => Navigator.pushNamed(context, "/resumen"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuración"),
            onTap: () => Navigator.pushNamed(context, "/config"),
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Cerrar sesión"),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
