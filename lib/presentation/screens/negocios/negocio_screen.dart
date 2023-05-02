import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/favorites/favorites_bloc.dart';

class NegocioScreen extends StatefulWidget {
  final int id;
  static const String name = "negocio_screen";
  const NegocioScreen({super.key, required this.id});

  @override
  State<NegocioScreen> createState() => _NegocioScreenState();
}

class _NegocioScreenState extends State<NegocioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NegociosBloc>().add(NegocioFetchedById(widget.id.toString()));
    //final user = context.read<UserBloc>().state.user;
    // context.read<FavoritesBloc>().add(LoadFavorites(user));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final negocio = context.watch<NegociosBloc>().state.negocio;
    const fontFamily = "Poppins";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(negocio: negocio),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _NegocioDetails(negocio: negocio, fontFamily: fontFamily),
                childCount: 1),
          )
        ],
      ),
    );
  }
}

class _NegocioDetails extends StatelessWidget {
  const _NegocioDetails({
    required this.negocio,
    required this.fontFamily,
  });

  final Negocios negocio;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Flexible(
                child: Text(
                  negocio.nombreEmpresa,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.direccion,
                    style: TextStyle(fontFamily: fontFamily),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.schedule,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.horario,
                    style: TextStyle(fontFamily: fontFamily),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.telefono,
                    style: TextStyle(fontFamily: fontFamily, fontSize: 12),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Productos',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 30,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: FadeInRight(
                        child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Placeholder(),
                    )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Promociones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: FadeInRight(
                        child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Placeholder(),
                    )),
                  );
                },
              ),
            ),
            Text(
              'Cupones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: FadeInRight(
                        child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Placeholder(),
                    )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Negocios negocio;

  const _CustomSliverAppBar({required this.negocio});
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
                context.read<UserBloc>().add(ToogleFavorites(negocio.id));
              },
              icon: context.read<UserBloc>().isFavorite(negocio.id)
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
              child: Image.network(
                negocio.photoUrl,
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
