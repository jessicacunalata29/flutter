import 'package:flutter/material.dart';

class PrivacidadScreen extends StatelessWidget {
  const PrivacidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacidad')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Cambiar Contraseña'),
          onPressed: () {
            final controller = TextEditingController();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Nueva Contraseña'),
                content: TextField(
                  controller: controller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa nueva contraseña',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Contraseña cambiada')),
                      );
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
