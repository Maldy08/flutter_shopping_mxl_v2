import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_mxl_v2/domain/datasource/negocios_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/mappers/negocios_mapper.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

class FirebaseNegociosDataSource extends NegociosDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseNegociosDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Negocios> getNegocioById({required String id}) async {
    try {
      final response = await _firebaseFirestore.collection('negocios');
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<List<Negocios>> getNegocios() async {
    List<Negocios> list = [];
    try {
      final response = await _firebaseFirestore.collection('negocios').get();
      for (var element in response.docs) {
        list.add(Negocios.fromJson(element.data()));
      }

      final negocios =
          list.map((e) => NegociosMapper.negociosToEntity(e)).toList();

      return negocios;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }
}
