import '../../domain/repositories/productos_repository.dart';
import '../datasources/firebase_productos_datasource.dart';
import '../models/models.dart';

class FirebaseProductosRepositoryImpl extends ProductosRepository {
  final FirebaseProductosDataSource dataSource;

  FirebaseProductosRepositoryImpl({FirebaseProductosDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseProductosDataSource();

  @override
  Future<List<Productos>> getAllProduct() {
    return dataSource.getAllProduct();
  }

  @override
  Future<Productos> getProductoById({required String id, required String uid}) {
    return dataSource.getProductoById(id: id, uid: uid);
  }

  @override
  Future<List<Productos>> getProductos({required String uid}) {
    return dataSource.getProductos(uid: uid);
  }

  @override
  Future<List<Productos>> getUserFavoritesProducts(
      {required List<String> favoritos}) {
    return dataSource.getUserFavoritesProducts(favoritos: favoritos);
  }
}
