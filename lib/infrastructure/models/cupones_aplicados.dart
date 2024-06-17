class CuponesAplicados {
  final String id;
  final String idCupon;
  final String descripcion;
  final String idNegocio;
  final String nombreNegocio;
  final String idUsuario;
  final String fechaAplicada;
  final String vigencia;
  final int vecesAplicada;

  const CuponesAplicados({
    required this.id,
    required this.idCupon,
    required this.descripcion,
    required this.idNegocio,
    required this.nombreNegocio,
    required this.idUsuario,
    required this.fechaAplicada,
    required this.vigencia,
    required this.vecesAplicada,
  });

  factory CuponesAplicados.fromJson(Map<String, dynamic> json) =>
      CuponesAplicados(
        id: json['id'],
        idCupon: json['id_cupon'],
        descripcion: json['descripcion'],
        idNegocio: json['id_negocio'],
        nombreNegocio: json['nombre_negocio'],
        idUsuario: json['id_usuario'],
        fechaAplicada: json['fecha_aplicada'],
        vigencia: json['vigencia'],
        vecesAplicada: json['veces_aplicada'],
      );

  factory CuponesAplicados.empty() => const CuponesAplicados(
        id: '',
        idCupon: '',
        descripcion: '',
        idNegocio: '',
        nombreNegocio: '',
        idUsuario: '',
        fechaAplicada: '',
        vigencia: '',
        vecesAplicada: 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_cupon": idCupon,
        "descripcion": descripcion,
        "id_negocio": idNegocio,
        "nombre_negocio": nombreNegocio,
        "id_usuario": idUsuario,
        "fecha_aplicada": fechaAplicada,
        "vigencia": vigencia,
        "veces_aplicada": vecesAplicada,
      };
}
