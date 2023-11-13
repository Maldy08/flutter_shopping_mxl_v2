import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/infrastructure/models/fcmnotifications.dart';
import '/infrastructure/infrastructure.dart';
import '/domain/entities/push_message.dart';
import '/presentation/blocs/fcmnotifications/fcmnotifications_bloc.dart';
import '/presentation/screens.dart';
import '/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  int pushNumberId = 0;

  static BuildContext? _context;

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

    //_onBackgroundMessage();
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  static void setContext(BuildContext context) =>
      NotificationsBloc._context = context;

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
        readed: false,
        data: event.pushMessage.data ?? event.pushMessage.data,
        imageUrl: event.pushMessage.imageUrl ?? event.pushMessage.imageUrl);

    FCMnotification fcmnotification = FCMnotification(
        email: auth.currentUser!.email!,
        messageId: event.pushMessage.messageId,
        title: event.pushMessage.title,
        body: event.pushMessage.body,
        readed: false,
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

  static Future<void> onTapNotification(RemoteMessage response) async {
    if (NotificationsBloc._context == null || response.data.isEmpty) return;
    // print(response.data["idnegocio"]);
    await Navigator.of(_context!).push(MaterialPageRoute(
        builder: (_context) =>
            NegocioScreen(id: response.data["idnegocio"].toString())));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      onTapNotification(event);
    });
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

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    if (message.notification == null) return;

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final firestore = FirebaseFirestore.instance;
    final email = FirebaseAuth.instance.currentUser!.email;

    FCMnotification fcmnotification = FCMnotification(
        email: email!,
        messageId: message.messageId!,
        title: message.notification!.title!,
        body: message.notification!.body!,
        readed: false,
        sentDate: message.sentTime.toString(),
        data: message.data);

    await firestore
        .collection("FCMnotifications")
        .doc()
        .set(fcmnotification.toJson());
  }
}
