import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/config/config.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/widgets/widgets.dart';

class FavoritesViewProducts extends StatelessWidget {
  const FavoritesViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.read<UserBloc>().state.user.favoritesProducts;
    final colors = Theme.of(context).colorScheme;

    if (favorites.isEmpty) {
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

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final producto = context
                    .read<ProductosBloc>()
                    .state
                    .favoritos
                    .where(
                        (element) => element.id == favorites[index].idproducto)
                    .first;

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bgContainer),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () =>
                              context.push('/home/0/producto/${producto.id}'),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: ImageLoading(
                                            photoUrl: producto.photoUrl),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        producto.descripcion,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      producto.nombreNegocio,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      producto.id,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
