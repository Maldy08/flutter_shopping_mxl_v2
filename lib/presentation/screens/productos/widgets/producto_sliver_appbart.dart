import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';

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
      expandedHeight: size.height * 0.25,
      actions: [
        BlocBuilder<ProductosBloc, ProductosState>(
          builder: (context, state) {
            if (state.status == ProductosStatus.fetching) {
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
              onPressed: () {},
              icon: const CircleAvatar(
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
              child: Image.network(
                producto.photoUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
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
