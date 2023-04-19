import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/negocios/negocios_bloc.dart';

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
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(negocio: empresa),
        ],
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
    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.3,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          negocio.nombreEmpresa,
          style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
        ),
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
