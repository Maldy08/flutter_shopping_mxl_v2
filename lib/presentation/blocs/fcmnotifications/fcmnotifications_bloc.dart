import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/infrastructure.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';

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
}
