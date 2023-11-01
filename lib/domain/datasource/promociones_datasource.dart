import '../../infrastructure/models/models.dart';

abstract class PromocionesDataSource {
  Future<List<Promociones>> getPromociones({required String uid});
  Future<Promociones> getPromocionById({required String id});
  Future<List<Promociones>> getAllPromociones();
}
