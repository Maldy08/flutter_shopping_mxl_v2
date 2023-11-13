import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/infrastructure/models/models.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/widgets/widgets.dart';

class ProductoSliveAppBar extends StatelessWidget {
  final Productos producto;

  const ProductoSliveAppBar({super.key, required this.producto});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final isfavorite = context.watch<UserBloc>().isFavoriteNegocio(negocio.id);
    // final isfavorite = context.watch<UserBloc>().state.isFavorite;

    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.50,
      actions: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.status == UserStatus.fetching) {
              return IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  child: SpinPerfect(
                    infinite: true,
                    child: const Icon(Icons.refresh_outlined),
                  ),
                ),
              );
            }

            return IconButton(
              onPressed: () {
                context
                    .read<UserBloc>()
                    .add(ToogleFavoritesProducts(producto.id));
              },
              icon: context.read<UserBloc>().isFavoriteProduct(producto.id)
                  ? CircleAvatar(
                      child: Icon(
                        Icons.favorite_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : const CircleAvatar(
                      child: Icon(
                        Icons.favorite_border,
                      ),
                    ),
            );
          },
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
                child: producto.photoUrl.isNotEmpty
                    ? Image.network(
                        producto.photoUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) return const SizedBox();
                          return FadeIn(child: child);
                        },
                        errorBuilder: (context, exception, stackTrace) {
                          return const Text('Error');
                        },
                      )
                    : const NoImage()),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87])),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        //end: Alignment.bottomCenter,
                        stops: [0.0, 0.3],
                        colors: [Colors.black87, Colors.transparent])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
