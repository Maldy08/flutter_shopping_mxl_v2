import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones.dart';

abstract class CuponesRepository {
  Future<List<Cupones>> getCupones({required String uid});
  Future<Cupones> getCuponById({required String id});
}
