import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/firebase_service.dart';
import '../widgets/cliente.dart';

class EditClientePage extends StatelessWidget {
  final Cliente cliente;
  final FirebaseService _firebaseService = FirebaseService();

  EditClientePage({
    super.key,
    required this.cliente,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
      ),
      body: ClienteForm(
        cliente: cliente,
        submitButtonText: 'Actualizar Cliente',
        onSubmit: (clienteActualizado) async {
          try {
            await _firebaseService.actualizarCliente(clienteActualizado);
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cliente actualizado correctamente'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error al actualizar: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
      ),
    );
  }
}