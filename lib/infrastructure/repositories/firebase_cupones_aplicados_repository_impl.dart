import 'package:flutter_shopping_mxl_v2/domain/repositories/cupones_aplicados_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_cupones_aplicados_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones_aplicados.dart';

class FirebaseCuponesAplicadosRepositoryImpl
    extends CuponesAplicadosRepository {
  final FirebaseCuponesAplicadosDataSource dataSource;

  FirebaseCuponesAplicadosRepositoryImpl(
      {FirebaseCuponesAplicadosDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseCuponesAplicadosDataSource();

  @override
  Future<void> aplicarCupon(
      {required String idCupon,
      required String descripcion,
      required String idNegocio,
      required String nombreNegocio,
      required String idUsuario,
      required String vigencia}) {
    return dataSource.aplicarCupon(
        idCupon: idCupon,
        descripcion: descripcion,
        idNegocio: idNegocio,
        nombreNegocio: nombreNegocio,
        idUsuario: idUsuario,
        vigencia: vigencia);
  }

  @override
  Future<List<CuponesAplicados>> getCuponesAplicados(
      {required String idUsuario}) {
    return dataSource.getCuponesAplicados(idUsuario: idUsuario);
  }
}
