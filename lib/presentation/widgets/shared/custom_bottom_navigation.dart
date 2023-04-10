import 'package:flutter/material.dart';
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
    const double size = 28;
    //final theme = Theme.of(context);
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: currentIndex,
        onTap: (index) => onItemTapped(context, index),
        //surfaceTintColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: size,
            ),
            label: 'Home',
            // activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: size,
            ),
            label: 'Search',
            // activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              size: size,
            ),
            label: 'Favorites',
            // activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: size,
            ),
            label: 'Settings',
            // activeIcon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
