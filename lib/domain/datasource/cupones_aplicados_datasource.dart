import '../../infrastructure/models/cupones_aplicados.dart';

abstract class CuponesAplicadosDataSource {
  Future<void> aplicarCupon(
      {required String idCupon,
      required String descripcion,
      required String idNegocio,
      required String nombreNegocio,
      required String idUsuario,
      required String vigencia});
  Future<List<CuponesAplicados>> getCuponesAplicados(
      {required String idUsuario});
}
