part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  final List<PushMessage> notifications;
  final String? messageToken;

  const NotificationsState(
      {this.status = AuthorizationStatus.notDetermined,
      this.notifications = const [],
      this.messageToken = ''});

  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
    String? messageToken,
  }) =>
      NotificationsState(
          status: status ?? this.status,
          notifications: notifications ?? this.notifications,
          messageToken: messageToken ?? this.messageToken);

  @override
  List<Object> get props => [status, notifications, messageToken!];
}
