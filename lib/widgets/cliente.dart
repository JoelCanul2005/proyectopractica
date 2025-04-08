import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ClienteForm extends StatefulWidget {
  final Cliente? cliente;
  final Function(Cliente) onSubmit;
  final String submitButtonText;

  const ClienteForm({
    super.key,
    this.cliente,
    required this.onSubmit,
    required this.submitButtonText,
  });

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

class _ClienteFormState extends State<ClienteForm> {
  final _formKey = GlobalKey<FormState>();
  late String nombre;
  late String telefono;
  late String email;
  late String calle;
  late String ciudad;
  late String codigoPostal;
  late String provincia;
  late String pais;

  @override
  void initState() {
    super.initState();
    nombre = widget.cliente?.nombre ?? '';
    telefono = widget.cliente?.telefono ?? '';
    email = widget.cliente?.email ?? '';
    calle = widget.cliente?.calle ?? '';
    ciudad = widget.cliente?.ciudad ?? '';
    codigoPostal = widget.cliente?.codigoPostal ?? '';
    provincia = widget.cliente?.provincia ?? '';
    pais = widget.cliente?.pais ?? '';
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final cliente = Cliente(
        id: widget.cliente?.id,
        nombre: nombre,
        telefono: telefono,
        email: email,
        calle: calle,
        ciudad: ciudad,
        codigoPostal: codigoPostal,
        provincia: provincia,
        pais: pais,
      );

      widget.onSubmit(cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: nombre,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) => value!.isEmpty ? 'Ingresa un nombre' : null,
              onSaved: (value) => nombre = value!,
            ),
            TextFormField(
              initialValue: telefono,
              decoration: const InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
              validator: (value) => value!.isEmpty ? 'Ingresa un teléfono' : null,
              onSaved: (value) => telefono = value!,
            ),
            TextFormField(
              initialValue: email,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty ? 'Ingresa un email' : null,
              onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 16),
            const Text(
              'DIRECCIÓN',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const Divider(),
            TextFormField(
              initialValue: calle,
              decoration: const InputDecoration(labelText: 'Calle'),
              validator: (value) => value!.isEmpty ? 'Ingresa una calle' : null,
              onSaved: (value) => calle = value!,
            ),
            TextFormField(
              initialValue: ciudad,
              decoration: const InputDecoration(labelText: 'Ciudad'),
              validator: (value) => value!.isEmpty ? 'Ingresa una ciudad' : null,
              onSaved: (value) => ciudad = value!,
            ),
            TextFormField(
              initialValue: codigoPostal,
              decoration: const InputDecoration(labelText: 'Código Postal'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Ingresa un código postal' : null,
              onSaved: (value) => codigoPostal = value!,
            ),
            TextFormField(
              initialValue: provincia,
              decoration: const InputDecoration(labelText: 'Provincia'),
              validator: (value) => value!.isEmpty ? 'Ingresa una provincia' : null,
              onSaved: (value) => provincia = value!,
            ),
            TextFormField(
              initialValue: pais,
              decoration: const InputDecoration(labelText: 'País'),
              validator: (value) => value!.isEmpty ? 'Ingresa un país' : null,
              onSaved: (value) => pais = value!,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: Text(widget.submitButtonText),
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}