import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../domain/datasource/fcmnotifications_datasource.dart';
import '../mappers/fcmnotifications_mapper.dart';
import '../models/models.dart';

class FirebaseFCMnotificationsDatasource extends FCMnotificationsDataSource
    with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFCMnotificationsDatasource({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<FCMnotification>> getNotifications(
      {required String email}) async {
    List<FCMnotification> list = [];
    try {
      final response = await _firebaseFirestore
          .collection("FCMnotifications")
          .where("email", isEqualTo: email)
          .get();

      for (var element in response.docs) {
        list.add(FCMnotification.fromJson(element.data()));
      }
      final notifications = list
          .map((e) => FCMnotificationsMapper.fcMnotificationToEntity(e))
          .toList();

      return notifications;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Future<void> saveNotification(
      {required String email,
      required String messageId,
      required String title,
      required String body,
      required String sentDate,
      Map<String, dynamic>? data,
      String? imageUrl}) async {
    FCMnotification nofitication = FCMnotification(
      email: email,
      messageId: messageId,
      title: title,
      body: body,
      sentDate: sentDate,
      data: data,
      imageUrl: imageUrl,
    );

    try {
      await _firebaseFirestore
          .collection("FCMnotifications")
          .doc()
          .set(nofitication.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }
}
