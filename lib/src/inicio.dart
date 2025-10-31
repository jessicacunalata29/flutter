import 'package:ejemplo/main.dart';
import 'package:flutter/material.dart';
import 'app.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Mi Diario Personal"),
        backgroundColor: const Color(0xFFFF6666), // 🌺 color coral cálido
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D0C2B), // azul oscuro espacial
              Color(0xFF3C1361), // violeta profundo
              Color(0xFFFF6666), // coral suave
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🌙 Ícono animado
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.self_improvement,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                const SizedBox(height: 30),

                // ✨ Mensaje principal
                const Text(
                  "Bienvenido a tu espacio de calma 🌙",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 20),

                // 💭 Frase inspiradora
                const Text(
                  "Escribe tus pensamientos, reflexiona sobre tu día y redescubre tu paz interior.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // 🌸 Botón principal
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "🪷 Pronto podrás escribir un nuevo apunte 🪷",
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Escribir un nuevo pensamiento"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFFF6666),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 6,
                    shadowColor: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1A1A1B),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFFF6666),
            ), // 🌺 color coral
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.self_improvement,
                    color: Color(0xFFFF6666),
                    size: 35,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Mi Diario",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Reflexiona y escribe cada día",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          _crearItem(Icons.home, "Inicio", context),
          _crearItem(Icons.favorite, "Favoritos", context),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "RECURSOS",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          _crearItem(Icons.settings, "Configuración", context),
          _crearItem(Icons.help_outline, "Ayuda", context),
          _crearItem(Icons.info_outline, "Acerca de", context),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              "Cerrar sesión",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  static ListTile _crearItem(
    IconData icon,
    String texto,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Abriste: $texto")));
      },
    );
  }
}
