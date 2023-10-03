import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';

abstract class PromocionesRepository {
  Future<List<Promociones>> getPromociones({required String uid});
  Future<Promociones> getPromocionById({required String id});
}
