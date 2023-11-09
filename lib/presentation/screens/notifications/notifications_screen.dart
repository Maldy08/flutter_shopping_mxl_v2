import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';

class NotificationsScreen extends StatefulWidget {
  static const String name = "notifications_screen";
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<FcmnotificationsBloc>().state.fcmnotifications;
    final colors = Theme.of(context).colorScheme;
    final status = context.watch<FcmnotificationsBloc>().state.status;

    return Container(
      child: context.read<FcmnotificationsBloc>().state.status ==
              FCMnotificationStatus.fetching
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                )
              ],
            ))
          : notifications.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 60,
                        color: colors.primary,
                      ),
                      const Text(
                        'No tienes notificaciones',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    child: BlocBuilder<FcmnotificationsBloc,
                        FcmnotificationsState>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: notifications.length,
                          itemBuilder: (context, index) {
                            final notification = state.fcmnotifications[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: bgContainer,
                                ),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          context
                                              .read<FcmnotificationsBloc>()
                                              .add(FCMNotificationsToogleState(
                                                  notification.messageId));
                                        },
                                        child: NotificationDetail(
                                            notification: notification))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}

class NotificationDetail extends StatelessWidget {
  final FCMnotification notification;
  const NotificationDetail({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return notification.readed != true
        ? Badge(
            alignment: Alignment.centerRight,
            backgroundColor: colors.primary,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          notification.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: false,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Text(
                        notification.body,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        notification.data.toString(),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250,
                      child: Text(
                        notification.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    Text(
                      notification.body,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      notification.data.toString(),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
