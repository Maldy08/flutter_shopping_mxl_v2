import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/promociones/widgets/widgets.dart';

class PromocionesScreen extends StatefulWidget {
  final int id;

  static const String name = "promocion_screen";
  const PromocionesScreen({super.key, required this.id});

  @override
  State<PromocionesScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PromocionesScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<PromocionesBloc>()
        .add(PromocionesFetchedById(widget.id.toString(), ''));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promocion = context.watch<PromocionesBloc>().state.promocion;
    final negocio = context.watch<NegociosBloc>().state.negocio;
    const fontFamily = "Poppins";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          PromocionesSliverAppBar(promocion: promocion),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => PromocionesDetails(
                    negocio: negocio,
                    promocion: promocion,
                    fontFamily: fontFamily),
                childCount: 1),
          )
        ],
      ),
    );
  }
}
