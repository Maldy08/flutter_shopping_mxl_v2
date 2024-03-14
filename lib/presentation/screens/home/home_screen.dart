import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/screens.dart';
import '/presentation/views/views.dart';
import '/presentation/widgets/widgets.dart';

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
    NotificationsBloc.setContext(context);
    super.initState();

    final email = context.read<AuthenticationBloc>().state.user.email;
    if (email == 'null') {
      context.read<AuthenticationBloc>().add(const LogoutRequested());
    }

    context.read<UserBloc>().add(UserLogged(
        context.read<AuthenticationBloc>().state.user.email ??
            'pruebas@google.com'));
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
    PromocionesView(),
    CuponesView(),
    NotificationScreenSnapshot(),
    SettingsView(),
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 30,
        ),
        backgroundColor: Colors.white,
        extendBody: true,
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
