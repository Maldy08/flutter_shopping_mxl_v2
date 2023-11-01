import 'categorias.dart';
import 'productos.dart';

class Promociones {
  final String id;
  final String descripcion;
  final List<Categorias> categorias;
  final List<Productos> productos;
  final int descuento;
  final String fechaCreacion;
  final String photoUrl;
  final String vigencia;
  final String uid;

  const Promociones({
    required this.id,
    required this.descripcion,
    required this.categorias,
    required this.productos,
    required this.descuento,
    required this.fechaCreacion,
    required this.photoUrl,
    required this.vigencia,
    required this.uid,
  });

  factory Promociones.fromJson(Map<String, dynamic> json) => Promociones(
        id: json['id'],
        descripcion: json['descripcion'],
        categorias: List<Categorias>.from(json["categorias"].map((x) => x)),
        productos: List<Productos>.from(json["productos"].map((x) => x)),
        descuento: json['descuento'],
        fechaCreacion: json['fecha_creacion'].toDate().toString(),
        photoUrl: json['photoUrl'],
        vigencia: json['vigencia'].toDate().toString(),
        uid: json['uid'],
      );

  factory Promociones.empty() => const Promociones(
        id: '',
        descripcion: '',
        categorias: [],
        productos: [],
        descuento: 0,
        fechaCreacion: '',
        photoUrl: '',
        vigencia: '',
        uid: '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "categorias": List<dynamic>.from(categorias.map((x) => x)),
        "productos": List<dynamic>.from(productos.map((x) => x)),
        "descuento": descuento,
        "fecha_creacion": fechaCreacion,
        "photoUrl": photoUrl,
        "vigencia": vigencia,
        "uid": uid
      };
}
