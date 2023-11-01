import '../../infrastructure/models/models.dart';

abstract class CuponesDataSource {
  Future<List<Cupones>> getCupones({required String uid});
  Future<Cupones> getCuponById({required String id});
  Future<List<Cupones>> getAllCupones();
}
