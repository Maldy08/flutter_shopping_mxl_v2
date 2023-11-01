import '../../infrastructure/models/models.dart';

abstract class FCMnotificationsDataSource {
  Future<List<FCMnotification>> getNotifications({required String email});
  Future<void> saveNotification(
      {required String email,
      required String messageId,
      required String title,
      required String body,
      required DateTime sentDate,
      Map<String, dynamic>? data,
      String? imageUrl});
}
