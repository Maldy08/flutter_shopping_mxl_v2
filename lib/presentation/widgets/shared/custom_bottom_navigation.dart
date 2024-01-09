import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

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
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser!.email ??
                'pruebas@google.com')
        .where("readed", isEqualTo: false)
        .snapshots();

    // const double size = 28;
    //final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        //backgroundColor: Colors.grey.shade100,
        enableFeedback: true,

        type: BottomNavigationBarType.fixed,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        iconSize: 26,

        // showSelectedLabels: false,
        //showUnselectedLabels: false,

        //backgroundColor: Colors.blue,

        currentIndex: widget.currentIndex,
        onTap: (index) => onItemTapped(context, index),
        //surfaceTintColor: Colors.white,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              // color: Colors.white,
              LineariconsFree.briefcase,
            ),
            label: 'AFILIADOS',
            // activeIcon: Icon(Icons.home_filled),
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Linecons.tag,
              ),
              label: "OFERTAS"),
          const BottomNavigationBarItem(
            icon: Icon(
              //  color: Colors.white,
              LineariconsFree.bookmark,
            ),
            label: 'CUPONES',
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
                      LineariconsFree.alarm,
                    ),
                  );
                }

                return const Icon(
                  LineariconsFree.alarm,
                );
              },
            ),
            label: 'NOTIFICACIONES',
            // activeIcon: Icon(Icons.favorite),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              //  color: Colors.white,
              LineariconsFree.user_1,
            ),
            label: 'USUARIO',
          ),
        ],
      ),
    );
  }
}
