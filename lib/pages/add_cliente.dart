import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../widgets/cliente.dart';

class AddCliente extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  AddCliente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Cliente'),
      ),
      body: ClienteForm(
        submitButtonText: 'Guardar Cliente',
        onSubmit: (cliente) async {
          try {
            await _firebaseService.crearCliente(cliente);
            if (context.mounted) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cliente guardado correctamente'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error al guardar: $e'),
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