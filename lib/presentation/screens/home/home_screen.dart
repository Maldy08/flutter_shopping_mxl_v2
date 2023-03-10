import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/views/views.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SearchView(),
    FavoritesView(),
    SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    // final theme = Theme.of(context);
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: IndexedStack(
            index: pageIndex,
            children: viewRoutes,
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex));
  }
}
