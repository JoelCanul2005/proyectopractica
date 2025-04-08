import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cliente.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> crearCliente(Cliente cliente) async {
    try {
      await _firestore.collection('clientes').add(cliente.toMap());
    } catch (e) {
      throw Exception('Error al crear cliente: $e');
    }
  }

  Stream<List<Cliente>> getClientes() {
    return _firestore
        .collection('clientes')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Cliente.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> actualizarCliente(Cliente cliente) async {
    try {
      if (cliente.id == null) throw Exception('ID de cliente no válido');
      await _firestore
          .collection('clientes')
          .doc(cliente.id)
          .update(cliente.toMap());
    } catch (e) {
      throw Exception('Error al actualizar cliente: $e');
    }
  }

  Future<void> eliminarCliente(String id) async {
    try {
      await _firestore.collection('clientes').doc(id).delete();
    } catch (e) {
      throw Exception('Error al eliminar cliente: $e');
    }
  }
}