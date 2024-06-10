import 'package:flutter_shopping_mxl_v2/infrastructure/datasources/firebase_promociones_aplicadas_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones_aplicadas.dart';

import '../../domain/repositories/promociones_aplicadas_repository.dart';

class FirebasePromocionesAplicadasRepositoryImpl
    extends PromocionesAplicadasRepository {
  final FirebasePromocionesAplicadasDataSource dataSource;

  FirebasePromocionesAplicadasRepositoryImpl(
      {FirebasePromocionesAplicadasDataSource? dataSource})
      : dataSource = dataSource ?? FirebasePromocionesAplicadasDataSource();

  @override
  Future<void> aplicarPromocion(
      {required String idPromocion,
      required String idNegocio,
      required String idUsuario,
      required String vigencia}) {
    return dataSource.aplicarPromocion(
        idPromocion: idPromocion,
        idNegocio: idNegocio,
        idUsuario: idUsuario,
        vigencia: vigencia);
  }

  @override
  Future<List<PromocionesAplicadas>> getPromocionesAplicadas(
      {required String idUsuario}) {
    return dataSource.getPromocionesAplicadas(idUsuario: idUsuario);
  }
}
