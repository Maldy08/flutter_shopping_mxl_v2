import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

abstract class NegociosDataSource {
  Future<List<Negocios>> getNegocios();
  Future<Negocios> getNegocioById({required String id});
}
