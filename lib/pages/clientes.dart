import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/firebase_service.dart';
import 'add_cliente.dart';
import 'editar_cliente.dart';

class Clientes extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  Clientes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCliente()),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Cliente>>(
        stream: _firebaseService.getClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay clientes registrados'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cliente = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(cliente.nombre),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${cliente.email}'),
                      Text('Teléfono: ${cliente.telefono}'),
                      Text('Ciudad: ${cliente.ciudad}'),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditClientePage(cliente: cliente),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => _mostrarDialogoConfirmacion(context, cliente),
                      ),
                    ],
                  ),
                  onTap: () => _mostrarDetallesCliente(context, cliente),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _mostrarDetallesCliente(BuildContext context, Cliente cliente) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(cliente.nombre),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Email: ${cliente.email}'),
              Text('Teléfono: ${cliente.telefono}'),
              const Divider(),
              const Text('Dirección:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Calle: ${cliente.calle}'),
              Text('Ciudad: ${cliente.ciudad}'),
              Text('Código Postal: ${cliente.codigoPostal}'),
              Text('Provincia: ${cliente.provincia}'),
              Text('País: ${cliente.pais}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoConfirmacion(BuildContext context, Cliente cliente) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Cliente'),
        content: Text('¿Estás seguro de que deseas eliminar a ${cliente.nombre}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              try {
                await _firebaseService.eliminarCliente(cliente.id!);
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cliente eliminado correctamente'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error al eliminar: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}