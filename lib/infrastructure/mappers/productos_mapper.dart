import '../models/models.dart';

class ProdcutosMapper {
  static Productos productosToEntity(Productos productos) => Productos(
        id: productos.id,
        descripcion: productos.descripcion,
        idCategoria: productos.idCategoria,
        idNegocio: productos.idNegocio,
        nombreNegocio: productos.nombreNegocio,
        precio: productos.precio,
        photoUrl: productos.photoUrl,
        uid: productos.uid,
      );
}
