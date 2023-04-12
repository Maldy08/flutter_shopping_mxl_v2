import 'package:flutter_shopping_mxl_v2/domain/repositories/negocios_repository.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

import '../datasources/firebase_negocios_datasource.dart';

class FirebaseNegociosRepositoryImpl extends NegociosRepository {
  final FirebaseNegociosDataSource dataSource;

  FirebaseNegociosRepositoryImpl({FirebaseNegociosDataSource? dataSource})
      : dataSource = dataSource ?? FirebaseNegociosDataSource();

  @override
  Future<Negocios> getNegocioById({required String id}) {
    return dataSource.getNegocioById(id: id);
  }

  @override
  Future<List<Negocios>> getNegocios() {
    return dataSource.getNegocios();
  }
}
