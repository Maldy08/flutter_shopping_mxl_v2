import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/infrastructure/models/negocios.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/screens/negocios/widgets/widgets.dart';

class NegocioScreen extends StatefulWidget {
  final String id;
  static const String name = "negocio_screen";
  const NegocioScreen({super.key, required this.id});

  @override
  State<NegocioScreen> createState() => _NegocioScreenState();
}

class _NegocioScreenState extends State<NegocioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NegociosBloc>().add(NegocioFetchedById(widget.id));
    context.read<ProductosBloc>().add(ProductosFetched(widget.id));
    context.read<PromocionesBloc>().add(PromocionesFetched(widget.id));
    context.read<CuponesBloc>().add(CuponesFetched(widget.id));
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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Negocio'),
          centerTitle: true,
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
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              child: _NegocioDetails(
            negocio: negocio,
          )),
        ));
  }
}

class _NegocioDetails extends StatelessWidget {
  const _NegocioDetails({
    required this.negocio,
  });

  final Negocios negocio;

  @override
  Widget build(BuildContext context) {
    // final productos = context.read<ProductosBloc>().state.productosByNegocio;
    // final promociones = context.read<PromocionesBloc>().state.promociones;

    return NegocioDetails(
      negocio: negocio,

      // productos: productos,
      // promociones: promociones,
    );
  }
}


// CustomScrollView(
//         physics: const ClampingScrollPhysics(),
//         slivers: [
//           NegocioSliveAppBar(negocio: negocio),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                 (context, index) =>
//                     _NegocioDetails(negocio: negocio, fontFamily: fontFamily),
//                 childCount: 1),
//           )
//         ],
//       ),