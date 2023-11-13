import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/infrastructure/infrastructure.dart';
import '/infrastructure/models/models.dart';

part 'fcmnotifications_event.dart';
part 'fcmnotifications_state.dart';

class FcmnotificationsBloc
    extends Bloc<FcmnotificationsEvent, FcmnotificationsState> {
  final FirebaseFCMnotificationsRepositoryImpl
      _firebaseFCMnotificationsRepositoryImpl;

  FcmnotificationsBloc(
      {FirebaseFCMnotificationsRepositoryImpl?
          firebaseFCMnotificationsRepositoryImpl})
      : _firebaseFCMnotificationsRepositoryImpl =
            firebaseFCMnotificationsRepositoryImpl ??
                FirebaseFCMnotificationsRepositoryImpl(),
        super(const FcmnotificationsState()) {
    on<FCMnotificationsFetched>(_fetchFCMnotifications);
    on<FCMNotificationsToogleState>(_onToogleState);
    on<FCMNotificationsDelete>(_onDeleteNotifications);
  }

  Future<void> _fetchFCMnotifications(FCMnotificationsFetched event,
      Emitter<FcmnotificationsState> emit) async {
    emit(state.copyWith(status: FCMnotificationStatus.fetching));

    // await Future.delayed(const Duration(seconds: 2));

    final notifications = await _firebaseFCMnotificationsRepositoryImpl
        .getNotifications(email: event.email);

    emit(state.copyWith(
        status: FCMnotificationStatus.completed,
        fcmnotifications: notifications));
  }

  Future<void> _onDeleteNotifications(
      FCMNotificationsDelete event, Emitter<FcmnotificationsState> emit) async {
    _firebaseFCMnotificationsRepositoryImpl.deleteNotifications(
        email: event.email);
  }

  Future<void> _onToogleState(FCMNotificationsToogleState event,
      Emitter<FcmnotificationsState> emit) async {
    await _firebaseFCMnotificationsRepositoryImpl.toogleState(
        messageId: event.messageId);

    // final filter = state.fcmnotifications
    //     .where((element) => element.messageId != event.messageId)
    //     .toList();

    // final filter = state.fcmnotifications
    //     .map((notificacion) {
    //       if (notificacion.messageId != event.messageId) {
    //         return notificacion;
    //       }
    //     })
    //     .nonNulls
    //     .toList();

    // emit(state.copyWith(fcmnotifications: filter));

    final readedNotifications = state.fcmnotifications.map((notification) {
      if (notification.messageId == event.messageId) {
        return notification.copyWith(readed: true);
      }
      return notification;
    }).toList();

    emit(state.copyWith(fcmnotifications: readedNotifications));
  }
}
