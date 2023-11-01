import '../models/models.dart';

class FCMnotificationsMapper {
  static FCMnotification fcMnotificationToEntity(
          FCMnotification fcMnotification) =>
      FCMnotification(
        email: fcMnotification.email,
        messageId: fcMnotification.messageId,
        title: fcMnotification.title,
        body: fcMnotification.body,
        sentDate: fcMnotification.sentDate,
        data: fcMnotification.data ?? fcMnotification.data,
        imageUrl: fcMnotification.imageUrl ?? fcMnotification.imageUrl,
      );
}
