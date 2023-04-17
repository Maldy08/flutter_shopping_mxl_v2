import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/views/views.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    SearchView(),
    FavoritesView(),
    SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        duration: const Duration(microseconds: 250),
        curve: Curves.easeInOut,
      );
    }
    //final scaffoldKey = GlobalKey<ScaffoldState>();
    // final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        // key: scaffoldKey,
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: viewRoutes,
          ),
        ),
        bottomNavigationBar:
            CustomBottomNavigation(currentIndex: widget.pageIndex));
  }

  @override
  bool get wantKeepAlive => true;
}
