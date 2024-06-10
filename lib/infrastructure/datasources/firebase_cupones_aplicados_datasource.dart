import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_shopping_mxl_v2/domain/datasource/cupones_aplicados_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones_aplicados.dart';

import '../mappers/cupones_aplicados_mapper.dart';

class FirebaseCuponesAplicadosDataSource extends CuponesAplicadosDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseCuponesAplicadosDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> aplicarCupon(
      {required String idCupon,
      required String idNegocio,
      required String idUsuario,
      required String vigencia}) async {
    try {
      await _firebaseFirestore
          .collection('cupones-aplicados')
          .where('id_cupon', isEqualTo: idCupon)
          .where('id_usuario', isEqualTo: idUsuario)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          final doc = value.docs.first;
          final data = doc.data();
          final vecesAplicada = data['veces_aplicada'] + 1;
          _firebaseFirestore
              .collection('cupones-aplicados')
              .doc(doc.id)
              .update({'veces_aplicada': vecesAplicada});
        } else {
          _firebaseFirestore.collection("cupones-aplicados").add({
            "id": _firebaseFirestore.collection("cupones-aplicados").doc().id,
            "id_cupon": idCupon,
            "id_negocio": idNegocio,
            "id_usuario": idUsuario,
            "vigencia": vigencia,
            "fecha_aplicada": DateTime.now().toString(),
            "veces_aplicada": 1,
          });
        }
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<List<CuponesAplicados>> getCuponesAplicados(
      {required String idUsuario}) async {
    List<CuponesAplicados> list = [];
    try {
      final response = await _firebaseFirestore
          .collection('cupones-aplicados')
          .where('id_usuario', isEqualTo: idUsuario)
          .get();

      for (var element in response.docs) {
        list.add(CuponesAplicados.fromJson(element.data()));
      }

      final cuponesAplicados = list
          .map((e) => CuponesAplicadosMapper.cuponesAplicadosToEntity(e))
          .toList();

      return cuponesAplicados;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }
}
