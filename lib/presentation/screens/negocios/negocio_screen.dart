import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
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
                (context, index) => Container(
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
                                  style: const TextStyle(
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
                                    style:
                                        const TextStyle(fontFamily: fontFamily),
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
                                    style:
                                        const TextStyle(fontFamily: fontFamily),
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
                                    style: const TextStyle(
                                        fontFamily: fontFamily, fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                childCount: 1),
          )
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
      expandedHeight: size.height * 0.25,
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
