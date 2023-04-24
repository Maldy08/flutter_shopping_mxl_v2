import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
          Text('Ohhh no!',
              style: TextStyle(fontSize: 30, color: colors.primary)),
          const Text('No tienes favoritos', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: const Text('Empieza a buscar'))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
