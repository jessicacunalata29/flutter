import 'package:flutter/material.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notificaciones')),
      body: const Center(
        child: Text(
          'Aquí puedes activar o desactivar notificaciones',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
