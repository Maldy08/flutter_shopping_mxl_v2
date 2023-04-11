import '../../infrastructure/models/models.dart';

abstract class NegociosRepository {
  Future<List<Negocios>> getNegocios();
  Future<Negocios> getNegocioById({required String id});
}
