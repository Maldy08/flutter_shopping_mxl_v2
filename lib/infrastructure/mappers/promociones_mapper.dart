import '../models/models.dart';

class PromocionesMapper {
  static Promociones promocionesToEntity(Promociones promociones) =>
      Promociones(
        id: promociones.id,
        descripcion: promociones.descripcion,
        categorias: promociones.categorias,
        productos: promociones.productos,
        descuento: promociones.descuento,
        fechaCreacion: promociones.fechaCreacion,
        photoUrl: promociones.photoUrl,
        vigencia: promociones.vigencia,
        uid: promociones.uid,
      );
}
