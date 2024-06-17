import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/image_loading.dart';
import '/config/config.dart';
import '/infrastructure/models/negocios.dart';
import '/infrastructure/models/promociones.dart';
import '../../../blocs/blocs.dart';

class PromocionesDetails extends StatefulWidget {
  final Promociones promocion;
  final Negocios negocio;

  const PromocionesDetails({
    super.key,
    required this.promocion,
    required this.negocio,
  });

  @override
  State<PromocionesDetails> createState() => _PromocionesDetailsState();
}

class _PromocionesDetailsState extends State<PromocionesDetails> {
  @override
  void initState() {
    super.initState();
    context.read<PromocionesAplicadasBloc>().add(
        PromocionesAplicadasFetched(context.read<UserBloc>().state.user.email));
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width * 0.92;
    return BlocListener<PromocionesAplicadasBloc, PromocionesAplicadasState>(
      listener: (context, state) {
        if (state.status == PromocionesAplicadasStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al aplicar promoción'),
              backgroundColor: Colors.red,
            ),
          );
        }

        // if (state.status == PromocionesAplicadasStatus.applied) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: const Text('Promoción aplicada con éxito'),
        //       backgroundColor: Theme.of(context).primaryColor,
        //     ),
        //   );
        // }
      },
      child: Container(
        color: bgContainer,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: Center(
                    child: ImageLoading(
                      photoUrl: widget.negocio.photoUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: 250,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.negocio.nombreEmpresa,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Vigencia: ${widget.promocion.vigencia.substring(0, 10)}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        widget.promocion.descripcion,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                context
                        .watch<PromocionesAplicadasBloc>()
                        .state
                        .promocionesAplicadas
                        .any((element) =>
                            element.idPromocion == widget.promocion.id)
                    ? FilledButton(
                        onPressed: () {},
                        child: const Text('Promocion aplicada'))
                    : FilledButton(
                        onPressed: () {
                          context.read<PromocionesAplicadasBloc>().add(
                                PromocionesAplicadasSave(
                                  descripcion: widget.promocion.descripcion,
                                  idPromocion: widget.promocion.id,
                                  nombreNegocio: widget.negocio.nombreEmpresa,
                                  idNegocio: widget.negocio.id,
                                  idUsuario:
                                      context.read<UserBloc>().state.user.email,
                                  vigencia: widget.promocion.vigencia,
                                ),
                              );

                          showModalBottomSheet(
                              context: context,
                              isDismissible: false,
                              builder: (context) {
                                return Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        context
                                                    .watch<
                                                        PromocionesAplicadasBloc>()
                                                    .state
                                                    .status ==
                                                PromocionesAplicadasStatus
                                                    .apliying
                                            ? const Column(
                                                children: [
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 10),
                                                  Text('Aplicando promocion...')
                                                ],
                                              )
                                            : const Text(
                                                'Promocion aplicada con éxito'),
                                        const SizedBox(height: 10),
                                        context
                                                    .watch<
                                                        PromocionesAplicadasBloc>()
                                                    .state
                                                    .status ==
                                                PromocionesAplicadasStatus
                                                    .apliying
                                            ? const SizedBox()
                                            : FilledButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cerrar'))
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Text('Aplicar'),
                      ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
