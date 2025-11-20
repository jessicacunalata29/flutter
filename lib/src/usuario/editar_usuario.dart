import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarUsuarioPage extends StatefulWidget {
  final String userId;
  final Map<String, dynamic> userData;

  const EditarUsuarioPage({super.key, required this.userId, required this.userData});

  @override
  State<EditarUsuarioPage> createState() => _EditarUsuarioPageState();
}

class _EditarUsuarioPageState extends State<EditarUsuarioPage> {
  late TextEditingController _nombreCtrl;
  late TextEditingController _apellidoCtrl;
  late TextEditingController _usuarioCtrl;
  late String _gender;

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.userData['nombre']);
    _apellidoCtrl = TextEditingController(text: widget.userData['apellido']);
    _usuarioCtrl = TextEditingController(text: widget.userData['usuario']);
    _gender = widget.userData['genero'];
  }

  Future<void> _actualizarUsuario() async {
    await FirebaseFirestore.instance.collection('usuarios').doc(widget.userId).update({
      "nombre": _nombreCtrl.text.trim(),
      "apellido": _apellidoCtrl.text.trim(),
      "usuario": _usuarioCtrl.text.trim(),
      "genero": _gender,
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuario actualizado")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Usuario"), backgroundColor: const Color(0xFFFF7043)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre')),
            TextField(controller: _apellidoCtrl, decoration: const InputDecoration(labelText: 'Apellido')),
            TextField(controller: _usuarioCtrl, decoration: const InputDecoration(labelText: 'Usuario')),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'Femenino',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v!),
                      ),
                      const Text("Femenino"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'Masculino',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v!),
                      ),
                      const Text("Masculino"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _actualizarUsuario,
              child: const Text("Guardar Cambios"),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF7043)),
            ),
          ],
        ),
      ),
    );
  }
}
