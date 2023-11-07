import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/fcmnotifications/fcmnotifications_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});
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
    const double size = 28;
    //final theme = Theme.of(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      enableFeedback: true,

      elevation: 2,
      type: BottomNavigationBarType.fixed,
      //backgroundColor: Colors.blue,

      currentIndex: currentIndex,
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
          icon: BlocBuilder<FcmnotificationsBloc, FcmnotificationsState>(
            builder: (context, state) {
              return state.fcmnotifications.isNotEmpty
                  ? Badge.count(
                      count: state.fcmnotifications.length,
                      largeSize: 15,
                      smallSize: 10,
                      textStyle: const TextStyle(fontSize: 10),
                      backgroundColor: colors.primary,
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: size,
                      ),
                    )
                  : const Icon(
                      Icons.notifications_outlined,
                      size: size,
                    );
            },
          ),
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
