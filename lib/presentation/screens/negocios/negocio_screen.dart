import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final empresa = context.watch<NegociosBloc>().state.negocio;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: context.watch<NegociosBloc>().state.status ==
                  NegociosStatus.fetching
              ? ''
              : empresa.nombreEmpresa),
      body: SafeArea(
          child: Container(
        color: Colors.amber,
        child: Center(child: Text(empresa.nombreEmpresa)),
      )),
    );
  }
}
