class Negocios {
  Negocios({
    required this.ciudad,
    required this.correo,
    required this.direccion,
    required this.estado,
    required this.giroEmpresa,
    required this.horario,
    required this.id,
    required this.nombreEmpresa,
    required this.nombreEncargado,
    required this.numeroEmpleados,
    required this.pais,
    required this.photoUrl,
    required this.telefono,
  });

  final String ciudad;
  final String correo;
  final String direccion;
  final String estado;
  final String giroEmpresa;
  final String horario;
  final String id;
  final String nombreEmpresa;
  final String nombreEncargado;
  final int numeroEmpleados;
  final String pais;
  final String photoUrl;
  final String telefono;

  factory Negocios.fromJson(Map<String, dynamic> json) => Negocios(
        ciudad: json["ciudad"],
        correo: json["correo"],
        direccion: json["direccion"],
        estado: json["estado"],
        giroEmpresa: json["giro_empresa"],
        horario: json["horario"],
        id: json["id"],
        nombreEmpresa: json["nombre_empresa"],
        nombreEncargado: json["nombre_encargado"],
        numeroEmpleados: json["numero_empleados"],
        pais: json["pais"],
        photoUrl: json["photoUrl"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "ciudad": ciudad,
        "correo": correo,
        "direccion": direccion,
        "estado": estado,
        "giro_empresa": giroEmpresa,
        "horario": horario,
        "id": id,
        "nombre_empresa": nombreEmpresa,
        "nombre_encargado": nombreEncargado,
        "numero_empleados": numeroEmpleados,
        "pais": pais,
        "photoUrl": photoUrl,
        "telefono": telefono,
      };
}
