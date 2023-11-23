import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/datasource/promociones_datasource.dart';
import '../mappers/promociones_mapper.dart';
import '../models/models.dart';

class FirebasePromocionesDataSource extends PromocionesDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebasePromocionesDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Promociones>> getPromociones({required String uid}) async {
    List<Promociones> list = [];
    final response = await _firebaseFirestore
        .collection('promociones')
        .where('id_negocio', isEqualTo: uid)
        .get();

    for (var element in response.docs) {
      list.add(Promociones.fromJson(element.data()));
    }

    final promociones =
        list.map((e) => PromocionesMapper.promocionesToEntity(e)).toList();

    return promociones;
  }

  @override
  Future<Promociones> getPromocionById({required String id}) async {
    Promociones? promociones;
    await _firebaseFirestore
        .collection('promociones')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      final docs = value.docs.first;
      promociones = Promociones.fromJson(docs.data());
    });

    return PromocionesMapper.promocionesToEntity(promociones!);
  }

  @override
  Future<List<Promociones>> getAllPromociones() async {
    List<Promociones> list = [];
    final response = await _firebaseFirestore
        .collection('promociones')
        .orderBy('id_negocio')
        .get();

    for (var element in response.docs) {
      list.add(Promociones.fromJson(element.data()));
    }

    final promociones =
        list.map((e) => PromocionesMapper.promocionesToEntity(e)).toList();

    return promociones;
  }
}
