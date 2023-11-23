import 'categorias.dart';
import 'productos.dart';

class Cupones {
  final String id;
  final String descripcion;
  final List<Categorias> categorias;
  final List<Productos> productos;
  final int descuento;
  final String fechaCreacion;
  final String photoUrl;
  final String vigencia;
  final String uid;
  final String idNegocio;

  const Cupones({
    required this.id,
    required this.descripcion,
    required this.categorias,
    required this.productos,
    required this.descuento,
    required this.fechaCreacion,
    required this.photoUrl,
    required this.vigencia,
    required this.uid,
    required this.idNegocio,
  });

  factory Cupones.fromJson(Map<String, dynamic> json) => Cupones(
      id: json['id'],
      descripcion: json['descripcion'],
      categorias: List<Categorias>.from(json["categorias"].map((x) => x)),
      productos: List<Productos>.from(json["productos"].map((x) => x)),
      descuento: json['descuento'],
      fechaCreacion: json['fecha_creacion'].toDate().toString(),
      photoUrl: json['photoUrl'],
      vigencia: json['vigencia'].toDate().toString(),
      uid: json['uid'],
      idNegocio: json['id_negocio']);

  factory Cupones.empty() => const Cupones(
      id: '',
      descripcion: '',
      categorias: [],
      productos: [],
      descuento: 0,
      fechaCreacion: '',
      photoUrl: '',
      vigencia: '',
      uid: '',
      idNegocio: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "categorias": List<dynamic>.from(categorias.map((x) => x)),
        "productos": List<dynamic>.from(productos.map((x) => x)),
        "descuento": descuento,
        "fecha_creacion": fechaCreacion,
        "photoUrl": photoUrl,
        "vigencia": vigencia,
        "uid": uid,
        "id_negocio": idNegocio
      };
}
