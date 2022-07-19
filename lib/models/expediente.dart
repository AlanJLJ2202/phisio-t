class Expediente{

  final String id;
  final String paciente_id;
  final String descripcion;
  final String nivel_dolor;
  final String nivel_inflamacion;
  final String signo_ta;
  final String signo_fc;
  final String signo_o2;
  final String fecha;



  Expediente({
    required this.id,
    required this.paciente_id,
    required this.descripcion,
    required this.nivel_dolor,
    required this.nivel_inflamacion,
    required this.signo_ta,
    required this.signo_fc,
    required this.signo_o2,
    required this.fecha,

  });


  factory Expediente.fromJson(Map<String, dynamic> json){

    return Expediente(
      id: json['expediente_id'],
      paciente_id: json['paciente_id'],
      descripcion: json['descripcion'],
      nivel_dolor: json['nivel_dolor'],
      nivel_inflamacion: json['nivel_inflamacion'],
      signo_ta: json['signo_ta'],
      signo_fc: json['signo_fc'],
      signo_o2: json['signo_o2'],
      fecha: json['fecha'],
    );

  }

  Map<String, dynamic> toMap(){

    return <String, dynamic>{
      "id": id,
      "paciente_id": paciente_id,
      "descripcion": descripcion,
      "nivel_dolor": nivel_dolor,
      "nivel_inflamacion": nivel_inflamacion,
      "signo_ta": signo_ta,
      "signo_fc": signo_fc,
      "signo_o2": signo_o2,
      "fecha": fecha
    };
  }

}
