import 'package:flutter/material.dart';
import 'package:ejemplo/src/app.dart';
import 'package:ejemplo/src/inicio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Diario Personal',
      home: const Homepage(), // 👈 Tu pantalla de login

      routes: {'/inicio': (context) => const Inicio()},
    );
  }
}
