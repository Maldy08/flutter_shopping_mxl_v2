import '../../infrastructure/models/models.dart';

abstract class NegociosDataSource {
  Future<List<Negocios>> getNegocios();
  Future<Negocios> getNegocioById({required String id});
}
