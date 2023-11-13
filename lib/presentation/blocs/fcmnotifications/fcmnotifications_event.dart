part of 'fcmnotifications_bloc.dart';

class FcmnotificationsEvent {
  const FcmnotificationsEvent();
}

class FCMnotificationsFetched extends FcmnotificationsEvent {
  final String email;
  FCMnotificationsFetched(this.email);
}

class FCMNotificationsToogleState extends FcmnotificationsEvent {
  final String messageId;
  FCMNotificationsToogleState(this.messageId);
}

class FCMNotificationsDelete extends FcmnotificationsEvent {
  final String email;
  FCMNotificationsDelete(this.email);
}
