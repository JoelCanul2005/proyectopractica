class Cliente {
  final String? id;
  final String nombre;
  final String telefono;
  final String email;
  final String calle;
  final String ciudad;
  final String codigoPostal;
  final String provincia;
  final String pais;

  Cliente({
    this.id,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.calle,
    required this.ciudad,
    required this.codigoPostal,
    required this.provincia,
    required this.pais,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'telefono': telefono,
      'email': email,
      'calle': calle,
      'ciudad': ciudad,
      'codigoPostal': codigoPostal,
      'provincia': provincia,
      'pais': pais,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map, String id) {
    return Cliente(
      id: id,
      nombre: map['nombre'] ?? '',
      telefono: map['telefono'] ?? '',
      email: map['email'] ?? '',
      calle: map['calle'] ?? '',
      ciudad: map['ciudad'] ?? '',
      codigoPostal: map['codigoPostal'] ?? '',
      provincia: map['provincia'] ?? '',
      pais: map['pais'] ?? '',
    );
  }
}