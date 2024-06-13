import '../../infrastructure/models/promociones_aplicadas.dart';

abstract class PromocionesAplicadasDataSource {
  Future<void> aplicarPromocion(
      {required String idPromocion,
      required String descripcion,
      required String idNegocio,
      required String nombreNegocio,
      required String idUsuario,
      required String vigencia});
  Future<List<PromocionesAplicadas>> getPromocionesAplicadas(
      {required String idUsuario});
}
