import 'package:flutter_shopping_mxl_v2/domain/repositories/productos_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_productos_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/productos.dart';

class FirebaseProductosRepositoryImpl extends ProductosRepository {
  final FirebaseProductosDataSource dataSource;

  FirebaseProductosRepositoryImpl({FirebaseProductosDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseProductosDataSource();

  @override
  Future<Productos> getProductoById({required String id, required String uid}) {
    return dataSource.getProductoById(id: id, uid: uid);
  }

  @override
  Future<List<Productos>> getProductos({required String uid}) {
    return dataSource.getProductos(uid: uid);
  }
}
