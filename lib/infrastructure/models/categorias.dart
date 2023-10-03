class Categorias {
  final String id;
  final String descripcion;
  final String negocioId;
  final String nombreNegocio;
  final String uid;

  const Categorias({
    required this.id,
    required this.descripcion,
    required this.negocioId,
    required this.nombreNegocio,
    required this.uid,
  });

  factory Categorias.fromJson(Map<String, dynamic> json) => Categorias(
        id: json['id'],
        descripcion: json['descripcion'],
        negocioId: json['negocioId'],
        nombreNegocio: json['nombreNegocio'],
        uid: json['uid'],
      );

  factory Categorias.empty() => const Categorias(
        id: '',
        descripcion: '',
        negocioId: '',
        nombreNegocio: '',
        uid: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "negocioId": negocioId,
        "nombreNegocio": nombreNegocio,
        "uid": uid
      };
}
