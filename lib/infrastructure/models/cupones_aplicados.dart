class CuponesAplicados {
  final String id;
  final String idCupon;
  final String idNegocio;
  final String idUsuario;
  final String fechaAplicada;
  final String vigencia;
  final int vecesAplicada;

  const CuponesAplicados({
    required this.id,
    required this.idCupon,
    required this.idNegocio,
    required this.idUsuario,
    required this.fechaAplicada,
    required this.vigencia,
    required this.vecesAplicada,
  });

  factory CuponesAplicados.fromJson(Map<String, dynamic> json) =>
      CuponesAplicados(
        id: json['id'],
        idCupon: json['id_promocion'],
        idNegocio: json['id_negocio'],
        idUsuario: json['id_usuario'],
        fechaAplicada: json['fecha_aplicada'],
        vigencia: json['vigencia'],
        vecesAplicada: json['veces_aplicada'],
      );

  factory CuponesAplicados.empty() => const CuponesAplicados(
        id: '',
        idCupon: '',
        idNegocio: '',
        idUsuario: '',
        fechaAplicada: '',
        vigencia: '',
        vecesAplicada: 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_cupon": idCupon,
        "id_negocio": idNegocio,
        "id_usuario": idUsuario,
        "fecha_aplicada": fechaAplicada,
        "vigencia": vigencia,
        "veces_aplicada": vecesAplicada,
      };
}
