class Productos {
  const Productos({
    required this.id,
    required this.descripcion,
    required this.idCategoria,
    required this.idNegocio,
    required this.nombreNegocio,
    required this.precio,
    required this.photoUrl,
    required this.uid,
  });

  final String id;
  final String descripcion;
  final String idCategoria;
  final String idNegocio;
  final String nombreNegocio;
  final double precio;
  final String photoUrl;
  final String uid;

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        id: json["id"],
        descripcion: json["descripcion"],
        idCategoria: json["id_categoria"],
        idNegocio: json["id_negocio"],
        nombreNegocio: json["nombreNegocio"],
        precio: json["precio"],
        photoUrl: json["photoUrl"],
        uid: json["uid"],
      );

  factory Productos.empty() => const Productos(
      id: '',
      descripcion: '',
      idCategoria: '',
      idNegocio: '',
      nombreNegocio: '',
      precio: 0,
      photoUrl: '',
      uid: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "id_categoria": idCategoria,
        "id_negocio": idNegocio,
        "nombreNegocio": nombreNegocio,
        "horario": precio,
        "precio": id,
        "photoUrl": photoUrl,
        "uid": uid,
      };
}
