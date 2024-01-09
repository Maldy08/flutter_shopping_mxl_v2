import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/config/config.dart';
import '/infrastructure/models/models.dart';
import '/presentation/blocs/fcmnotifications/fcmnotifications_bloc.dart';

class NotificationScreenSnapshot extends StatefulWidget {
  static const String name = "notifications_screen";
  const NotificationScreenSnapshot({super.key});

  @override
  State<NotificationScreenSnapshot> createState() =>
      _NotificationScreenSnapshotState();
}

class _NotificationScreenSnapshotState
    extends State<NotificationScreenSnapshot> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> notificationsStream = FirebaseFirestore.instance
        .collection('FCMnotifications')
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser!.email ??
                'pruebas@google.com')
        .orderBy("sentDate", descending: true)
        .snapshots();
    final colors = Theme.of(context).colorScheme;

    return StreamBuilder<QuerySnapshot>(
      stream: notificationsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                )
              ],
            ),
          );
        }

        if (snapshot.hasData && snapshot.data!.size == 0) {
          return Center(
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
          );
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Card(
              surfaceTintColor: bgContainer,
              elevation: 0.25,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: data['readed'] == true
                    ? Icon(
                        Icons.circle_outlined,
                        color: colors.primary,
                        size: 18,
                      )
                    : Icon(
                        Icons.circle,
                        color: colors.primary,
                        size: 18,
                      ),
                title: Text(
                  data['title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Text(
                  data['body'],
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () {
                  context
                      .read<FcmnotificationsBloc>()
                      .add(FCMNotificationsToogleState(data['messageId']));
                },
              ),
            );
          }).toList())),
        );
      },
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
