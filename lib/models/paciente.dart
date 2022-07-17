

class Paciente{

  final String id;
  final String nombre;
  final String telefono;
  final String edad;
  final String fecha_nacimiento;
  final String? ocupacion;
  final String? direccion;
  final String? enfermedad_cronica;
  final String? otra_enfermedad;


  Paciente({
    required this.id,
    required this.nombre,
    required this.telefono,
    required this.edad,
    required this.fecha_nacimiento,
    this.ocupacion,
    this.direccion,
    this.enfermedad_cronica,
    this.otra_enfermedad
  });


  factory Paciente.fromJson(Map<String, dynamic> json){

    return Paciente(
      id: json['paciente_id'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      edad: json['edad'],
      fecha_nacimiento: json['fecha_nacimiento'],
      ocupacion: json['ocupacion'],
      direccion: json['direccion'],
      enfermedad_cronica: json['enfermedad_cronica'] != null ? json['enfermedad_cronica'] : null,
      otra_enfermedad: json['otra_enfermedad'] != null ? json['otra_enfermedad'] : null,
    );

  }

  Map<String, dynamic> toMap(){

    return <String, dynamic>{
      "paciente_id": id,
      "nombre": nombre,
      "telefono": telefono,
      "edad": edad,
      "fecha_nacimiento": fecha_nacimiento,
      "ocupacion": ocupacion,
      "direccion": direccion,
      "enfermedad_cronica": enfermedad_cronica,
      "otra_enfermedad": otra_enfermedad
    };
  }

}
