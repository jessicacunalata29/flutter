import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _gender = 'Femenino'; // Estado del género

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Encabezado con imagen y título
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/diario.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.black26, offset: Offset(1, 2)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Formulario
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Apellido',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar contraseña',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 🔹 Sección de género actualizada para evitar deprecated
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sexo:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Femenino',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() => _gender = value!);
                                  },
                                ),
                                const Text('Femenino'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: 'Masculino',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() => _gender = value!);
                                  },
                                ),
                                const Text('Masculino'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cuenta creada con éxito 💖'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Registrar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7043),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Volver'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFFF7043)),
                          foregroundColor: const Color(0xFFFF7043),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
