import '/domain/repositories/fcmnotifications_repository.dart';
import '../datasources/firebase_fcmnotifications_datasource.dart';
import '../models/models.dart';

class FirebaseFCMnotificationsRepositoryImpl extends FCMnoticationsRepository {
  final FirebaseFCMnotificationsDatasource datasource;

  FirebaseFCMnotificationsRepositoryImpl(
      {FirebaseFCMnotificationsDatasource? datasource})
      : datasource = datasource ?? FirebaseFCMnotificationsDatasource();

  @override
  Future<List<FCMnotification>> getNotifications({required String email}) {
    return datasource.getNotifications(email: email);
  }

  @override
  Future<void> saveNotification(
      {required String email,
      required String messageId,
      required String title,
      required String body,
      required String sentDate,
      required bool readed,
      Map<String, dynamic>? data,
      String? imageUrl}) {
    return datasource.saveNotification(
      email: email,
      messageId: messageId,
      title: title,
      body: body,
      sentDate: sentDate,
      readed: readed,
      data: data ?? data,
      imageUrl: imageUrl ?? imageUrl,
    );
  }

  @override
  Future<void> toogleState({required String messageId}) {
    return datasource.toogleState(messageId: messageId);
  }

  @override
  Future<void> deleteNotifications({required String email}) {
    return datasource.deleteNotifications(email: email);
  }
}
