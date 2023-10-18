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
    // SearchView(),
    FavoritesView(
      pageIndex: 1,
    ),
    SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserBloc>().state.user;
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 70,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app-logo-white.png',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'ENOFFERTA',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
          actions: [
            IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.search_outlined,
                size: 28,
              ),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Busqueda no implementada')));
              },
            ),
            // const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: CircleAvatar(
            //     child: user.photoUrl != null
            //         ? ClipOval(
            //             child: Image.network(
            //               user.photoUrl!,
            //               fit: BoxFit.cover,
            //               errorBuilder: (context, exception, stackTrace) {
            //                 return const Text('Error');
            //               },
            //             ),
            //           )
            //         : IconButton(
            //             onPressed: () {},
            //             icon: const Icon(Icons.account_circle_rounded),
            //           ),
            //   ),
            // )
          ],
        ),
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
