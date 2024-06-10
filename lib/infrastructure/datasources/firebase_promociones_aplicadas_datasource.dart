import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/mappers/promociones_aplicadas_mapper.dart';
import '../../domain/datasource/promociones_aplicadas_datasource.dart';
import '../models/promociones_aplicadas.dart';

class FirebasePromocionesAplicadasDataSource
    extends PromocionesAplicadasDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebasePromocionesAplicadasDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> aplicarPromocion(
      {required String idPromocion,
      required String idNegocio,
      required String idUsuario,
      required String vigencia}) async {
    try {
      await _firebaseFirestore
          .collection('promociones-aplicadas')
          .where('id_promocion', isEqualTo: idPromocion)
          .where('id_usuario', isEqualTo: idUsuario)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          final doc = value.docs.first;
          final data = doc.data();
          final vecesAplicada = data['veces_aplicada'] + 1;
          _firebaseFirestore
              .collection('promociones-aplicadas')
              .doc(doc.id)
              .update({'veces_aplicada': vecesAplicada});
        } else {
          _firebaseFirestore.collection("promociones-aplicadas").add({
            "id":
                _firebaseFirestore.collection("promociones-aplicadas").doc().id,
            "id_promocion": idPromocion,
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
  Future<List<PromocionesAplicadas>> getPromocionesAplicadas(
      {required String idUsuario}) async {
    List<PromocionesAplicadas> list = [];
    try {
      final response = await _firebaseFirestore
          .collection('promociones-aplicadas')
          .where('id_usuario', isEqualTo: idUsuario)
          .get();

      for (var element in response.docs) {
        list.add(PromocionesAplicadas.fromJson(element.data()));
      }

      final promocionesAplicadas = list
          .map(
              (e) => PromocionesAplicadasMapper.promocionesAplicadasToEntity(e))
          .toList();

      return promocionesAplicadas;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }
}
