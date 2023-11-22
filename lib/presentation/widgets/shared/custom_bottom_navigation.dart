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
      case 4:
        context.go('/home/4');
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
            Icons.business_outlined,
            size: size,
          ),
          label: 'Afiliados',
          // activeIcon: Icon(Icons.home_filled),
        ),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_outlined,
              size: size,
            ),
            label: "Ofertas"),
        const BottomNavigationBarItem(
          icon: Icon(
            //  color: Colors.white,
            Icons.local_activity_outlined,
            size: size,
          ),
          label: 'Cupones',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            //color: Colors.white,
            Icons.favorite_outline,
            size: size,
          ),
          label: 'Favoritos',
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
          ),
          label: 'Notificaciones',
          // activeIcon: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
