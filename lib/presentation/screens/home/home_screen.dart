import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/views/views.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomSelectedIndex = 0;
  final viewRoutes = const <Widget>[
    HomeView(),
    SearchView(),
    FavoritesView(),
    SettingsView()
  ];

  PageController pageController =
      PageController(initialPage: 0, keepPage: false);

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void onBottomTap(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final scaffoldKey = GlobalKey<ScaffoldState>();
    const double size = 28;
    // final theme = Theme.of(context);
    return Scaffold(
      //key: scaffoldKey,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: viewRoutes,
          onPageChanged: (index) => pageChanged(index),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        width: double.infinity,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: bottomSelectedIndex,
          onTap: (index) => onBottomTap(index),
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
                Icons.settings_outlined,
                size: size,
              ),
              label: 'Settings',
              // activeIcon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
