import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

class FavoritesViewNegocios extends StatelessWidget {
  const FavoritesViewNegocios({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.read<UserBloc>().state.user.favoritesNegocios!;
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
                final negocio = context
                    .read<NegociosBloc>()
                    .state
                    .negocios
                    .where((element) =>
                        element.id == favorites[index].idnegocio.toString())
                    .first;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.push('/home/0/negocio/${negocio.id}'),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    negocio.photoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    negocio.nombreEmpresa,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    negocio.telefono,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins', fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
