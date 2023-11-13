import 'package:cloud_firestore/cloud_firestore.dart';
import '/domain/datasource/cupones_datasource.dart';
import '../mappers/cupones_mapper.dart';
import '../models/models.dart';

class FirebaseCuponesDataSource extends CuponesDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseCuponesDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Cupones> getCuponById({required String id}) async {
    Cupones? cupones;
    await _firebaseFirestore
        .collection('cupones')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      final docs = value.docs.first;
      cupones = Cupones.fromJson(docs.data());
    });

    return CuponesMapper.cuponesToEntity(cupones!);
  }

  @override
  Future<List<Cupones>> getCupones({required String uid}) async {
    List<Cupones> list = [];
    final response = await _firebaseFirestore
        .collection('cupones')
        .where('id_negocio', isEqualTo: uid)
        .get();

    for (var element in response.docs) {
      list.add(Cupones.fromJson(element.data()));
    }

    final cupones = list.map((e) => CuponesMapper.cuponesToEntity(e)).toList();
    return cupones;
  }

  @override
  Future<List<Cupones>> getAllCupones() async {
    List<Cupones> list = [];
    final response = await _firebaseFirestore.collection('cupones').get();

    for (var element in response.docs) {
      list.add(Cupones.fromJson(element.data()));
    }

    final cupones = list.map((e) => CuponesMapper.cuponesToEntity(e)).toList();
    return cupones;
  }
}
