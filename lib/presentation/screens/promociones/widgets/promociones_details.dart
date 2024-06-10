import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/image_loading.dart';
import '../../../blocs/blocs.dart';
import '/config/config.dart';
import '/infrastructure/models/negocios.dart';
import '/infrastructure/models/promociones.dart';

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
    final idUsuario = context.read<UserBloc>().state.user.email;

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

        if (state.status == PromocionesAplicadasStatus.applied) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Promoción aplicada con éxito'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
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
                      )),
                ),
                const SizedBox(height: 20),
                context.read<PromocionesAplicadasBloc>().state.status ==
                            PromocionesAplicadasStatus.applied ||
                        context
                            .read<PromocionesAplicadasBloc>()
                            .state
                            .promocionesAplicadas
                            .any((element) =>
                                element.idPromocion == widget.promocion.id)
                    ? FilledButton(
                        onPressed: () {},
                        child: const Text('Promoción aplicada'))
                    : FilledButton(
                        onPressed: () {
                          context.read<PromocionesAplicadasBloc>().add(
                              PromocionesAplicadasSave(
                                  idPromocion: widget.promocion.id,
                                  idNegocio: widget.promocion.idNegocio,
                                  idUsuario: idUsuario,
                                  vigencia: widget.promocion.vigencia));
                        },
                        child: context
                                    .watch<PromocionesAplicadasBloc>()
                                    .state
                                    .status ==
                                PromocionesAplicadasStatus.apliying
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Row(
                                  children: [
                                    SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: 10),
                                    Text('Aplicando promoción...'),
                                  ],
                                ),
                              )
                            : const Text('Aplicar promoción'),
                      ),
                const SizedBox(height: 10),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: Colors.white),
                //   padding: const EdgeInsets.all(15),
                //   child: BarcodeWidget(
                //     data: promocion.id,
                //     barcode: Barcode.code128(),
                //     width: double.infinity,
                //     height: 100,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
