import 'package:ejemplo/src/pantallas/configuracion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejemplo/src/app.dart';
import 'package:ejemplo/src/inicio.dart';
import 'src/state/app_state.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Mensaje para verificar la conexión
  print("🔥 Firebase inicializado correctamente");

  runApp(
    ChangeNotifierProvider(create: (_) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App de Diario Personal',
          theme: appState.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const Homepage(),
          routes: {
            '/inicio': (context) => const Inicio(),
            '/configuracion': (context) => const Configuracion(),
          },
        );
      },
    );
  }
}
