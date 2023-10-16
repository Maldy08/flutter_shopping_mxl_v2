import 'package:flutter_shopping_mxl_v2/domain/repositories/promociones_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_promociones_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';

class FirebasePromocionesRepositoryImpl extends PromocionesRepository {
  final FirebasePromocionesDataSource dataSource;

  FirebasePromocionesRepositoryImpl({FirebasePromocionesDataSource? dataSource})
      : dataSource = dataSource ?? FirebasePromocionesDataSource();

  @override
  Future<Promociones> getPromocionById({required String id}) {
    return dataSource.getPromocionById(id: id);
  }

  @override
  Future<List<Promociones>> getPromociones({required String uid}) {
    return dataSource.getPromociones(uid: uid);
  }

  @override
  Future<List<Promociones>> getAllPromociones() {
    return dataSource.getAllPromociones();
  }
}
