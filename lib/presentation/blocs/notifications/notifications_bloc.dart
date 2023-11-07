import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/fcmnotifications.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/fcmnotifications/fcmnotifications_bloc.dart';

import '../../../domain/entities/push_message.dart';
import '../../../firebase_options.dart';
import '../../../infrastructure/infrastructure.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  //print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  int pushNumberId = 0;

  final Future<void> Function()? requestLocalNotificationPermissions;
  final FirebaseFCMtokensRepositoryImpl _fcMtokensRepositoryImpl;
  final FirebaseFCMnotificationsRepositoryImpl
      _firebaseFCMnotificationsRepositoryImpl;

  final void Function(
      {required int id,
      String? title,
      String? body,
      String? data})? showLocalNotification;

  final FcmnotificationsBloc _fcmnotificationsBloc;

  NotificationsBloc(
      {this.requestLocalNotificationPermissions,
      this.showLocalNotification,
      FirebaseFCMtokensRepositoryImpl? fcMtokensRepositoryImpl,
      FirebaseFCMnotificationsRepositoryImpl? fcMnotificationsRepositoryImpl,
      FirebaseFCMnotificationsRepositoryImpl?
          firebaseFCMnotificationsRepositoryImpl,
      FcmnotificationsBloc? fcmnotificationsBloc})
      : _fcMtokensRepositoryImpl =
            fcMtokensRepositoryImpl ?? FirebaseFCMtokensRepositoryImpl(),
        _firebaseFCMnotificationsRepositoryImpl =
            firebaseFCMnotificationsRepositoryImpl ??
                FirebaseFCMnotificationsRepositoryImpl(),
        _fcmnotificationsBloc = fcmnotificationsBloc ?? FcmnotificationsBloc(),
        super(const NotificationsState()) {
    ////
    on<NotificationStatusChanged>(_notificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);
    on<NotificationToken>(_setNotificationToken);

    // Verificar estado de las notificaciones
    _initialStatusCheck();

    // Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: event.status));
    if (event.status == AuthorizationStatus.authorized) {
      _getFCMToken();
    }
  }

  void _setNotificationToken(
      NotificationToken event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(messageToken: event.messageToken));
  }

  void setNotificationToken() async {
    final token = await _getFCMToken();
    add(NotificationToken(token));
  }

  void _onPushMessageReceived(
      NotificationReceived event, Emitter<NotificationsState> emit) async {
    emit(state
        .copyWith(notifications: [event.pushMessage, ...state.notifications]));
    await _firebaseFCMnotificationsRepositoryImpl.saveNotification(
        email: auth.currentUser!.email!,
        messageId: event.pushMessage.messageId,
        title: event.pushMessage.title,
        body: event.pushMessage.body,
        sentDate: event.pushMessage.sentDate.toString(),
        data: event.pushMessage.data ?? event.pushMessage.data,
        imageUrl: event.pushMessage.imageUrl ?? event.pushMessage.imageUrl);

    FCMnotification fcmnotification = FCMnotification(
        email: auth.currentUser!.email!,
        messageId: event.pushMessage.messageId,
        title: event.pushMessage.title,
        body: event.pushMessage.body,
        sentDate: event.pushMessage.sentDate.toString());

    _fcmnotificationsBloc.state
        .copyWith(status: FCMnotificationStatus.fetching);

    // final noti = await _firebaseFCMnotificationsRepositoryImpl.getNotifications(
    //     email: auth.currentUser!.email!);

    _fcmnotificationsBloc
        .add(FCMnotificationsFetched(auth.currentUser!.email!));

    _fcmnotificationsBloc.state.copyWith(fcmnotifications: [
      fcmnotification,
      ..._fcmnotificationsBloc.state.fcmnotifications
    ], status: FCMnotificationStatus.completed);

    // _fcmnotificationsBloc.notifyListeners();
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  Future<String> _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return '';

    final token = await messaging.getToken();
    messaging.subscribeToTopic("pushNotifications");
    _fcMtokensRepositoryImpl.saveToken(
      email: auth.currentUser!.email!,
      uid: auth.currentUser!.uid,
      token: token!,
    );

    print(token);
    return token;
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessage(
        messageId:
            message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        sentDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
            ? message.notification!.android?.imageUrl
            : message.notification!.apple?.imageUrl);

    if (showLocalNotification != null) {
      showLocalNotification!(
          id: ++pushNumberId,
          body: notification.body,
          data: notification.messageId,
          title: notification.title);
    }
    add(NotificationReceived(notification));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
    // FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    // Solicitar permiso a las local notifications
    if (requestLocalNotificationPermissions != null) {
      await requestLocalNotificationPermissions!();
      // await LocalNotifications.requestPermissionLocalNotifications();
    }

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String pushMessageId) {
    final exist = state.notifications
        .any((element) => element.messageId == pushMessageId);
    if (!exist) return null;

    return state.notifications
        .firstWhere((element) => element.messageId == pushMessageId);
  }
}
