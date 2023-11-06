import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/fcmnotifications/fcmnotifications_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class NotificationsScreen extends StatefulWidget {
  static const String name = "notifications_screen";
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    final email = context.read<AuthenticationBloc>().state.user.email;
    context.read<FcmnotificationsBloc>().add(FCMnotificationsFetched(email!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.watch<FcmnotificationsBloc>().state.fcmnotifications;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'Notificaciones'),
        body: notifications.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
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
                  child: BlocBuilder<NotificationsBloc, NotificationsState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
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
                                      onTap: () {},
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       vertical: 5),
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.symmetric(
                                          //             vertical: 5),
                                          //     child: SizedBox(
                                          //       height: 100,
                                          //       width: 100,
                                          //       child: Padding(
                                          //         padding:
                                          //             const EdgeInsets.only(
                                          //                 left: 10),
                                          //         child: ClipRRect(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           child: ImageLoading(
                                          //               photoUrl:
                                          //                   notifications[index]
                                          //                       .imageUrl!),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 250,
                                                  child: Text(
                                                    notifications[index].title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    softWrap: false,
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  notifications[index].body,
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  notifications[index]
                                                      .data
                                                      .toString(),
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
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                  ),
                ),
              ));
  }
}
