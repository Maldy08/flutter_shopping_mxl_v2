import '../../infrastructure/models/cupones_aplicados.dart';

abstract class CuponesAplicadosRepository {
  Future<void> aplicarCupon(
      {required String idCupon,
      required String idNegocio,
      required String idUsuario,
      required String vigencia});
  Future<List<CuponesAplicados>> getCuponesAplicados(
      {required String idUsuario});
}
