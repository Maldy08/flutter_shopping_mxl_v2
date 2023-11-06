part of 'fcmnotifications_bloc.dart';

enum FCMnotificationStatus {
  fetching,
  completed,
}

class FcmnotificationsState extends Equatable {
  final FCMnotificationStatus status;
  final List<FCMnotification> fcmnotifications;
  //  final FCMnotification fcMnotification;

  const FcmnotificationsState({
    this.status = FCMnotificationStatus.fetching,
    // this.fcMnotification =     FCMnotification(email: '', messageId: '', title: '', body: '', sentDate: const DateTime.now(), data: const {[]}, imageUrl: ''),
    this.fcmnotifications = const [],
  });

  FcmnotificationsState copyWith(
          {FCMnotificationStatus? status,
          List<FCMnotification>? fcmnotifications}) =>
      FcmnotificationsState(
          status: status ?? this.status,
          fcmnotifications: fcmnotifications ?? this.fcmnotifications);

  @override
  List<Object> get props => [status, fcmnotifications];
}
