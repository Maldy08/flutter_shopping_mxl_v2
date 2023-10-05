import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones.dart';

class CuponesMapper {
  static Cupones cuponesToEntity(Cupones cupones) => Cupones(
        id: cupones.id,
        descripcion: cupones.descripcion,
        categorias: cupones.categorias,
        productos: cupones.productos,
        descuento: cupones.descuento,
        fechaCreacion: cupones.fechaCreacion,
        photoUrl: cupones.photoUrl,
        vigencia: cupones.vigencia,
        uid: cupones.uid,
      );
}
