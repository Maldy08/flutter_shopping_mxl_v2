import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/negocios/widgets/widgets.dart';

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
    context.read<ProductosBloc>().add(ProductosFetched(widget.id.toString()));
    context
        .read<PromocionesBloc>()
        .add(PromocionesFetched(widget.id.toString()));
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
          NegocioSliveAppBar(negocio: negocio),
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
    final productos = context.watch<ProductosBloc>().state.productos;
    final promociones = context.watch<PromocionesBloc>().state.promociones;

    return NegocioDetails(
      negocio: negocio,
      fontFamily: fontFamily,
      productos: productos,
      promociones: promociones,
    );
  }
}
