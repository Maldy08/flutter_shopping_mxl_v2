import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/blocs/blocs.dart';
import '/presentation/screens/promociones/widgets/widgets.dart';

class PromocionesScreen extends StatefulWidget {
  final String id;

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
    final promocion = context
        .watch<PromocionesBloc>()
        .state
        .promociones
        .where((element) => element.id == widget.id)
        .first;
    final negocio = context
        .watch<NegociosBloc>()
        .state
        .negocios
        .where((element) => element.id == promocion.idNegocio)
        .first;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Promocion'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: PromocionesDetails(negocio: negocio, promocion: promocion),
          ),
        ));
  }
}
