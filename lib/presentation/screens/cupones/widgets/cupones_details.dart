import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/image_loading.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../blocs/blocs.dart';
import '/config/config.dart';
import '/infrastructure/models/cupones.dart';
import '/infrastructure/models/negocios.dart';

class CuponesDetails extends StatefulWidget {
  final Cupones cupon;
  final Negocios negocio;

  const CuponesDetails({
    super.key,
    required this.cupon,
    required this.negocio,
  });

  @override
  State<CuponesDetails> createState() => _CuponesDetailsState();
}

class _CuponesDetailsState extends State<CuponesDetails> {
  @override
  void initState() {
    super.initState();
    context.read<CuponesAplicadosBloc>().add(
        CuponesAplicadosFetched(context.read<UserBloc>().state.user.email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CuponesAplicadosBloc, CuponesAplicadosState>(
      listener: (context, state) {
        if (state.status == CuponesAplicadosStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al aplicar cupón'),
              backgroundColor: Colors.red,
            ),
          );
        }

        // if (state.status == CuponesAplicadosStatus.applied) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: const Text('Cupón aplicado con éxito'),
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
                                  'Vigencia: ${widget.cupon.vigencia.substring(0, 10)}',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: QrImageView(
                                data: widget.cupon.id,
                              ),
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
                        widget.cupon.descripcion,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                context
                        .watch<CuponesAplicadosBloc>()
                        .state
                        .cuponesAplicados
                        .any((element) => element.idCupon == widget.cupon.id)
                    ? FilledButton(
                        onPressed: () {}, child: const Text('Cupón aplicado'))
                    : FilledButton(
                        onPressed: () {
                          context.read<CuponesAplicadosBloc>().add(
                                CuponesAplicadosSave(
                                  descripcion: widget.cupon.descripcion,
                                  idCupon: widget.cupon.id,
                                  nombreNegocio: widget.negocio.nombreEmpresa,
                                  idNegocio: widget.negocio.id,
                                  idUsuario:
                                      context.read<UserBloc>().state.user.email,
                                  vigencia: widget.cupon.vigencia,
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
                                                        CuponesAplicadosBloc>()
                                                    .state
                                                    .status ==
                                                CuponesAplicadosStatus.apliying
                                            ? const Column(
                                                children: [
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 10),
                                                  Text('Aplicando cupón...')
                                                ],
                                              )
                                            : const Text(
                                                'Cupón aplicado con éxito'),
                                        const SizedBox(height: 10),
                                        context
                                                    .watch<
                                                        CuponesAplicadosBloc>()
                                                    .state
                                                    .status ==
                                                CuponesAplicadosStatus.apliying
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
                        child: const Text('Canjear'),
                      ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  padding: const EdgeInsets.all(15),
                  child: BarcodeWidget(
                    data: widget.cupon.id,
                    barcode: Barcode.code128(),
                    width: double.infinity,
                    height: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
