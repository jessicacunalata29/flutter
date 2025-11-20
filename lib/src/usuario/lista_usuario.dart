import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaUsuariosPage extends StatelessWidget {
  const ListaUsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Usuarios"),
        backgroundColor: const Color(0xFFFF7043),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('usuarios')
            .orderBy("fechaRegistro", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No hay usuarios registrados"));
          }

          final usuarios = snapshot.data!.docs;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuarios[index];
              final data = usuario.data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Color(0xFFFF7043)),
                  title: Text(
                    "${data['nombre'] ?? ''} ${data['apellido'] ?? ''}",
                  ),
                  subtitle: Text(
                    "Usuario: ${data['usuario'] ?? ''} • Género: ${data['genero'] ?? ''}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data['fechaRegistro'] != null
                            ? (data['fechaRegistro'] as Timestamp)
                                  .toDate()
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0]
                            : '',
                      ),
                      const SizedBox(width: 8),
                      // Editar
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () =>
                            _editarUsuario(context, usuario.id, data),
                      ),
                      // Eliminar
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('usuarios')
                              .doc(usuario.id)
                              .delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Usuario eliminado")),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // 🔹 Diálogo bonito de edición con StatefulBuilder
  void _editarUsuario(
    BuildContext context,
    String id,
    Map<String, dynamic> data,
  ) {
    final _nombreCtrl = TextEditingController(text: data['nombre']);
    final _apellidoCtrl = TextEditingController(text: data['apellido']);
    final _usuarioCtrl = TextEditingController(text: data['usuario']);
    String _genero = data['genero'] ?? 'Femenino';

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Editar Usuario",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7043),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nombreCtrl,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _apellidoCtrl,
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _usuarioCtrl,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.account_circle),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: 'Femenino',
                            groupValue: _genero,
                            onChanged: (v) {
                              setState(() {
                                _genero = v!;
                              });
                            },
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
                            groupValue: _genero,
                            onChanged: (v) {
                              setState(() {
                                _genero = v!;
                              });
                            },
                          ),
                          const Text("Masculino"),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('usuarios')
                            .doc(id)
                            .update({
                              "nombre": _nombreCtrl.text.trim(),
                              "apellido": _apellidoCtrl.text.trim(),
                              "usuario": _usuarioCtrl.text.trim(),
                              "genero": _genero,
                            });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Usuario actualizado")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7043),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: const Text("Guardar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
