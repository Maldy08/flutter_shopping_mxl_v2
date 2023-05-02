import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shopping_mxl_v2/domain/datasource/user_datasource.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/mappers/user_mapper.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/user.dart';

class FirebaseUserDatasource extends UserDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserDatasource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<User?> getCurrentAppUser({required String email}) async {
    User? usuario;
    await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      final docs = value.docs.first;
      usuario = User.fromJson(docs.data());
    });

    return UserMapper.userToEntity(usuario!);
  }

  @override
  Future<bool> isUserExists({required String email}) async {
    bool exists = false;
    try {
      await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) => value.size > 0 ? exists = true : exists = false);
    } catch (e) {
      throw Exception(e.toString());
    }

    return exists;
  }

  @override
  Future<void> toogleFavorite({required User user}) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get()
          .then((value) {
        //_firebaseFirestore.collection('users').doc(value.docs[0].id);
        final doc =
            _firebaseFirestore.collection('users').doc(value.docs[0].id);

        doc.update(user.toJson());
      });
    } catch (e) {
      throw Exception(e.toString());
    }

    //  print(doc);

    // usuario = U

    // .then((value) {
    // final negocios = value.docs[0].data()['favorites_negocios'];

    //  value.docs.
    // for (var i = 0; i < value.docs.length; i++) {
    //   //value.docs[0].get('favorites_negocios')
    //   print(value.docs[0].data());
    //   print(id);
    // }
    // });
  }
}
