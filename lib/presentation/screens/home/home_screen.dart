import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
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
    context
        .read<UserBloc>()
        .add(UserLogged(context.read<AuthenticationBloc>().state.user.email!));
    pageController = PageController(
      keepPage: true,
      viewportFraction: 1,
    );
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
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
    //final scaffoldKey = GlobalKey<ScaffoldState>();
    // final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        // key: scaffoldKey,
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: viewRoutes,
          ),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
                color: Colors.blue),
            child: CustomBottomNavigation(currentIndex: widget.pageIndex)));
  }

  @override
  bool get wantKeepAlive => true;
}
