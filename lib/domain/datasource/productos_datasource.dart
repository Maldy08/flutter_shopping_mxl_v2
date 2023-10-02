import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class ProductosDataSource {
  Future<List<Productos>> getProductos({required String uid});
  Future<Productos> getProductoById({required String id, required String uid});
}
