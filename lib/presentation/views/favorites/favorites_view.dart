import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/views/views.dart';

// import 'package:go_router/go_router.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key, required this.pageIndex});
  final int pageIndex;

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  final viewRoutes = const <Widget>[
    FavoritesViewNegocios(),
    FavoritesViewProducts(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            enableFeedback: true,
            tabs: [
              Tab(
                icon: Icon(Icons.business_center_outlined),
                text: 'Negocios',
              ),
              Tab(
                icon: Icon(Icons.shopping_bag_outlined),
                text: 'Productos',
              )
            ],
          ),
          centerTitle: true,
          title: const Text('Favoritos'),
        ),
        body: TabBarView(
          children: viewRoutes,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
