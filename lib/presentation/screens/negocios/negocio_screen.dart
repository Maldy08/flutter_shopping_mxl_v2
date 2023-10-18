import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/negocios/widgets/widgets.dart';

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
    const fontFamily = "Poppins";

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Negocio'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              child: _NegocioDetails(
            fontFamily: fontFamily,
            negocio: negocio,
          )),
        ));
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
    // final productos = context.read<ProductosBloc>().state.productosByNegocio;
    // final promociones = context.read<PromocionesBloc>().state.promociones;

    return NegocioDetails(
      negocio: negocio,
      fontFamily: fontFamily,
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