import 'dart:async';
import 'package:ejemplo/main.dart';
import 'package:flutter/material.dart';
import '../src/app.dart';
import 'pantallas/favoritos.dart';
import 'pantallas/configuracion.dart';
import 'pantallas/ayuda.dart';
import 'pantallas/acerca_de.dart';
import 'pantallas/home_screen.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  // 🎨 Fondo animado
  List<Color> colores = [
    const Color(0xFF0D0C2B),
    const Color(0xFF3C1361),
    const Color(0xFFFF6666),
  ];

  int indice = 0;
  Timer? _timer;

  // 🌙 Animaciones de flotación y escala (efecto "respiración")
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // ✨ Animación de entrada (fade + slide)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // 🌈 Cambia el fondo gradualmente cada pocos segundos
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      setState(() {
        colores.shuffle();
      });
    });

    // 🌬️ Animación de flotación
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // 💗 Animación de escala suave (efecto respiración)
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _floatController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Mi Diario Personal"),
        backgroundColor: const Color(0xFFFF6666),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colores,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _floatController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, -_floatAnimation.value),
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: child,
                          ),
                        );
                      },
                      child: AnimatedContainer(
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
                    ),
                    const SizedBox(height: 30),
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
                    const Text(
                      "Escribe tus pensamientos, reflexiona sobre tu día y redescubre tu paz interior.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
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
            decoration: const BoxDecoration(color: Color(0xFFFF6666)),
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
                (route) => false,
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
        Widget destino;

        switch (texto) {
          case "Inicio":
            destino = const HomeScreen();
            break;
          case "Favoritos":
            destino = const Favoritos();
            break;
          case "Configuración":
            destino = const Configuracion();
            break;
          case "Ayuda":
            destino = const Ayuda();
            break;
          case "Acerca de":
            destino = const Acercade();
            break;
          default:
            destino = const Inicio();
        }

        Navigator.push(context, MaterialPageRoute(builder: (_) => destino));
      },
    );
  }
}
