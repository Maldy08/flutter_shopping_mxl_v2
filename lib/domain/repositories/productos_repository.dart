import '../../infrastructure/models/models.dart';

abstract class ProductosRepository {
  Future<List<Productos>> getAllProduct();
  Future<List<Productos>> getProductos({required String uid});
  Future<Productos> getProductoById({required String id, required String uid});
  Future<List<Productos>> getUserFavoritesProducts(
      {required List<String> favoritos});
}
