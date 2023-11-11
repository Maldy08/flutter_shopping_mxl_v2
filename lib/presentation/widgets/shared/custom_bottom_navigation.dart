import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Stream<QuerySnapshot> notificationsStream = FirebaseFirestore.instance
        .collection('FCMnotifications')
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
        .where("readed", isEqualTo: false)
        .snapshots();

    const double size = 28;
    //final theme = Theme.of(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      enableFeedback: true,

      elevation: 2,
      type: BottomNavigationBarType.fixed,
      //backgroundColor: Colors.blue,

      currentIndex: widget.currentIndex,
      onTap: (index) => onItemTapped(context, index),
      //surfaceTintColor: Colors.white,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            // color: Colors.white,
            Icons.home_max,
            size: size,
          ),
          label: 'Inicio',
          // activeIcon: Icon(Icons.home_filled),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(
        //     // color: Colors.white,
        //     Icons.search,
        //     size: size,
        //   ),
        //   label: 'Buscar',
        //   // activeIcon: Icon(Icons.search),
        // ),
        const BottomNavigationBarItem(
          icon: Icon(
            //color: Colors.white,
            Icons.favorite_outline,
            size: size,
          ),
          label: 'Favoritos',
          // activeIcon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          icon: StreamBuilder<QuerySnapshot>(
            stream: notificationsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.size > 0) {
                return Badge.count(
                  count: snapshot.hasData ? snapshot.data!.size : 0,
                  largeSize: 15,
                  smallSize: 10,
                  textStyle: const TextStyle(fontSize: 10),
                  backgroundColor: colors.primary,
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: size,
                  ),
                );
              }

              return const Icon(
                Icons.notifications_outlined,
                size: size,
              );
            },
          )
          // BlocBuilder<FcmnotificationsBloc, FcmnotificationsState>(
          //   builder: (context, state) {
          //     return state.fcmnotifications
          //             .where((element) => element.readed == false)
          //             .isNotEmpty
          //         ? Badge.count(
          //             count: state.fcmnotifications
          //                 .where((element) => element.readed == false)
          //                 .length,
          //             largeSize: 15,
          //             smallSize: 10,
          //             textStyle: const TextStyle(fontSize: 10),
          //             backgroundColor: colors.primary,
          //             child: const Icon(
          //               Icons.notifications_outlined,
          //               size: size,
          //             ),
          //           )
          //         : const Icon(
          //             Icons.notifications_outlined,
          //             size: size,
          //           );
          //   },
          // ),
          ,
          label: 'Notificaciones',
          // activeIcon: Icon(Icons.favorite),
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            //  color: Colors.white,
            Icons.account_circle_outlined,
            size: size,
          ),
          label: 'Usuario',

          // activeIcon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
