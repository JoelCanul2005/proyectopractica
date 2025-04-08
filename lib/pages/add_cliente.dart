import 'package:flutter/material.dart';

class AddCliente extends StatefulWidget {
  const AddCliente({super.key});

  @override
  _AddClienteState createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  final _formKey = GlobalKey<FormState>();
  String nombre = '';
  String telefono = '';
  String email = '';
  String calle = '';
  String ciudad = '';
  String codigoPostal = '';
  String provincia = '';
  String pais = '';

  void _guardarCliente() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Imprimir los datos en la consola para verificar
      print('Nombre: $nombre');
      print('Teléfono: $telefono');
      print('Email: $email');
      print('Calle: $calle');
      print('Ciudad: $ciudad');
      print('Código Postal: $codigoPostal');
      print('Provincia: $provincia');
      print('País: $pais');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos guardados (en consola)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Cliente'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Añadir Cliente', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                // Campos del cliente
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) => value!.isEmpty ? 'Ingresa un nombre' : null,
                  onSaved: (value) => nombre = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty ? 'Ingresa un email' : null,
                  onSaved: (value) => email = value!,
                ),
                const SizedBox(height: 16),
                // Sección de dirección
                const Text(
                  'DIRECCIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const Divider(),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Calle'),
                  validator: (value) => value!.isEmpty ? 'Ingresa una calle' : null,
                  onSaved: (value) => calle = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ciudad'),
                  validator: (value) => value!.isEmpty ? 'Ingresa una ciudad' : null,
                  onSaved: (value) => ciudad = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Código Postal'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Ingresa un código postal' : null,
                  onSaved: (value) => codigoPostal = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Provincia'),
                  validator: (value) => value!.isEmpty ? 'Ingresa una provincia' : null,
                  onSaved: (value) => provincia = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'País'),
                  validator: (value) => value!.isEmpty ? 'Ingresa un país' : null,
                  onSaved: (value) => pais = value!,
                ),
                const SizedBox(height: 20),
                // Botón para guardar
                ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar Cliente'),
                  onPressed: _guardarCliente,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}