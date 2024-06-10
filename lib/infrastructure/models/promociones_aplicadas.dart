class PromocionesAplicadas {
  final String id;
  final String idPromocion;
  final String idNegocio;
  final String idUsuario;
  final String fechaAplicada;
  final String vigencia;
  final int vecesAplicada;

  const PromocionesAplicadas({
    required this.id,
    required this.idPromocion,
    required this.idNegocio,
    required this.idUsuario,
    required this.fechaAplicada,
    required this.vigencia,
    required this.vecesAplicada,
  });

  factory PromocionesAplicadas.fromJson(Map<String, dynamic> json) =>
      PromocionesAplicadas(
        id: json['id'],
        idPromocion: json['id_promocion'],
        idNegocio: json['id_negocio'],
        idUsuario: json['id_usuario'],
        fechaAplicada: json['fecha_aplicada'],
        vigencia: json['vigencia'],
        vecesAplicada: json['veces_aplicada'],
      );

  factory PromocionesAplicadas.empty() => const PromocionesAplicadas(
        id: '',
        idPromocion: '',
        idNegocio: '',
        idUsuario: '',
        fechaAplicada: '',
        vigencia: '',
        vecesAplicada: 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_promocion": idPromocion,
        "id_negocio": idNegocio,
        "id_usuario": idUsuario,
        "fecha_aplicada": fechaAplicada,
        "vigencia": vigencia,
        "veces_aplicada": vecesAplicada,
      };
}
