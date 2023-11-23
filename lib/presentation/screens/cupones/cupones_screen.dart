import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/cupones/cupones_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/cupones/widgets/cupones_details.dart';

class CuponesScreen extends StatefulWidget {
  final String id;
  static const String name = "cupon_screen";
  const CuponesScreen({super.key, required this.id});

  @override
  State<CuponesScreen> createState() => _CuponesScreenState();
}

class _CuponesScreenState extends State<CuponesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CuponesBloc>().add(CuponesFetchedById(widget.id));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cupon = context
        .watch<CuponesBloc>()
        .state
        .cupones
        .where((element) => element.id == widget.id)
        .first;
    final negocio = context
        .watch<NegociosBloc>()
        .state
        .negocios
        .where((element) => element.id == cupon.idNegocio)
        .first;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Cupon'),
          centerTitle: true,
        ),
        body: SizedBox(
          child: CuponesDetails(
            cupon: cupon,
            negocio: negocio,
          ),
        ));
  }
}
