import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class ProductosRepository {
  Future<List<Productos>> getProductos();
  Future<Productos> getProductoById({required String id, required String uid});
}
