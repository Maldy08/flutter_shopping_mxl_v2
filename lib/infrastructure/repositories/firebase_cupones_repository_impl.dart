import '../../domain/repositories/cupones_repository.dart';
import '../datasources/firebase_cupones_datasource.dart';
import '../models/models.dart';

class FirebaseCuponesRepositoryImpl extends CuponesRepository {
  final FirebaseCuponesDataSource dataSource;

  FirebaseCuponesRepositoryImpl({FirebaseCuponesDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseCuponesDataSource();

  @override
  Future<Cupones> getCuponById({required String id}) {
    return dataSource.getCuponById(id: id);
  }

  @override
  Future<List<Cupones>> getCupones({required String uid}) {
    return dataSource.getCupones(uid: uid);
  }

  @override
  Future<List<Cupones>> getAllCupones() {
    return dataSource.getAllCupones();
  }
}
