import 'package:flutter/material.dart';

class TemaScreen extends StatelessWidget {
  const TemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema')),
      body: const Center(
        child: Text(
          'Aquí puedes cambiar entre tema claro y oscuro',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
