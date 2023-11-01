import '../../domain/repositories/promociones_repository.dart';
import '../datasources/firebase_promociones_datasource.dart';
import '../models/models.dart';

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
