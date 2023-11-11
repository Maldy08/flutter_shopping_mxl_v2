import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/datasource/fcmtokens_datasource.dart';
import '../mappers/fcmtokens_mapper.dart';
import '../models/models.dart';

class FirebaseFCMtokensDataSource extends FCMtokensDataSource {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFCMtokensDataSource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<FCMtokens>> getAllTokens() async {
    List<FCMtokens> list = [];
    try {
      final response = await _firebaseFirestore.collection("FCMtokens").get();
      for (var element in response.docs) {
        list.add(FCMtokens.fromJson(element.data()));
      }

      final tokens =
          list.map((e) => FCMtokensMapper.fcmtokensToEntity(e)).toList();
      return tokens;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<List<FCMtokens>> getTokensByUser({required String email}) async {
    List<FCMtokens> list = [];
    try {
      final response = await _firebaseFirestore
          .collection("FCMtokens")
          .where("email", isEqualTo: email)
          .get();
      for (var element in response.docs) {
        list.add(FCMtokens.fromJson(element.data()));
      }
      final tokens =
          list.map((e) => FCMtokensMapper.fcmtokensToEntity(e)).toList();

      return tokens;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<void> saveToken(
      {required String email,
      required String uid,
      required String token}) async {
    bool exists = false;
    try {
      await _firebaseFirestore
          .collection("FCMtokens")
          .where("email", isEqualTo: email)
          .where("token", isEqualTo: token)
          .get()
          .then((value) => value.size > 0 ? exists = true : exists = false);

      if (!exists) {
        final doc = _firebaseFirestore.collection("FCMtokens").doc();

        doc.set({
          "email": email,
          "token": token,
          "uid": uid,
          "createdAt": DateTime.now().toString(),
          "platform": defaultTargetPlatform.toString(),
        });
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }
}
