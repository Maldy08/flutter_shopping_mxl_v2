import '../../infrastructure/models/promociones_aplicadas.dart';

abstract class PromocionesAplicadasRepository {
  Future<void> aplicarPromocion(
      {required String idPromocion,
      required String idNegocio,
      required String idUsuario,
      required String vigencia});
  Future<List<PromocionesAplicadas>> getPromocionesAplicadas(
      {required String idUsuario});
}
