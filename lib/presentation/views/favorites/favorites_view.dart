import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favoritos'),
      ),
      body: const FavoritesViewNegocios(),
    );
  }
}
