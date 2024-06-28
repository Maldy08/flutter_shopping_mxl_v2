import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

import '/presentation/views/views.dart';

class FavoritesView extends StatefulWidget {
  static const String name = "favorites_view";
  const FavoritesView({super.key, required this.pageIndex});
  final int pageIndex;

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    // context
    //     .watch<UserBloc>()
    //     .state
    //     .user
    //     .favoritesProducts
    //     .map((e) => e.idproducto)
    //     .toList();

    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Favoritos',
      ),
      body: FavoritesViewNegocios(),
    );
  }
}
