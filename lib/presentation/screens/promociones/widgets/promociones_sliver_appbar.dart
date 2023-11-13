import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/infrastructure/models/promociones.dart';
import '/presentation/blocs/blocs.dart';

class PromocionesSliverAppBar extends StatelessWidget {
  final Promociones promocion;

  const PromocionesSliverAppBar({super.key, required this.promocion});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.50,
      actions: [
        BlocBuilder<PromocionesBloc, PromocionesState>(
          builder: (context, state) {
            if (state.status == PromocionesStatus.fetching) {
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
              child: Image.asset(
                'assets/images/discount.png',
                fit: BoxFit.cover,
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
