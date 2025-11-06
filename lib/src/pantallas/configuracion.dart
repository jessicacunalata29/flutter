import 'package:ejemplo/src/notificaciones_screen.dart';
import 'package:ejemplo/src/privacidad_screen.dart';
import 'package:ejemplo/src/tema_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: appState.isDarkTheme
          ? Colors.grey[900]
          : Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Configuración',
          style: TextStyle(
            color: appState.isDarkTheme ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: appState.isDarkTheme
            ? Colors.purple[700]
            : Colors.purple[200],
        iconTheme: IconThemeData(
          color: appState.isDarkTheme ? Colors.white : Colors.black87,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tema
            Card(
              color: appState.isDarkTheme
                  ? Colors.purple[300]
                  : Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.palette, color: Colors.black87),
                title: const Text(
                  'Tema',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: appState.isDarkTheme,
                  onChanged: (value) => appState.toggleTheme(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TemaScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Privacidad
            Card(
              color: appState.isDarkTheme
                  ? Colors.blueGrey[300]
                  : Colors.blue[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.lock, color: Colors.black87),
                title: const Text(
                  'Privacidad',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PrivacidadScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Notificaciones
            Card(
              color: appState.isDarkTheme
                  ? Colors.orange[300]
                  : Colors.yellow[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.black87),
                title: const Text(
                  'Notificaciones',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: appState.notificationsEnabled,
                  onChanged: (value) => appState.toggleNotifications(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificacionesScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
