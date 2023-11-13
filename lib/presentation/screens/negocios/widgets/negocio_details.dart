import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/config/config.dart';
import '/infrastructure/models/models.dart';
import '/presentation/blocs/blocs.dart';
import '/presentation/screens/cupones/widgets/widgets.dart';
import '/presentation/screens/productos/widgets/widgets.dart';
import '/presentation/screens/promociones/widgets/promociones_list.dart';
import '/presentation/widgets/widgets.dart';

class NegocioDetails extends StatelessWidget {
  final Negocios negocio;
  final String fontFamily;
  //final List<Productos> productos;
  //final List<Promociones> promociones;

  const NegocioDetails({
    super.key,
    required this.negocio,
    required this.fontFamily,
    // required this.productos,
    // required this.promociones,
  });

  @override
  Widget build(BuildContext context) {
    final productos = context.watch<ProductosBloc>().state.productosByNegocio;
    final promociones =
        context.watch<PromocionesBloc>().state.promocionesByNegocio;
    final cupones = context.watch<CuponesBloc>().state.cuponesByNegocio;
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(negocio.id)));
    return Container(
      color: bgContainer,
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(125),
                    child: ImageLoading(
                      photoUrl: negocio.photoUrl,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              negocio.nombreEmpresa,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   negocio.giroEmpresa,
                            //   style: const TextStyle(fontSize: 14),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              negocio.direccion,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              negocio.horario,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              negocio.telefono,
                              style: const TextStyle(fontSize: 14),
                            )
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
                            data: negocio.id,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeIn(
              delay: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Catalogo de Productos'),
                    SizedBox(
                      height: 250,
                      child:
                          ProductosList(productos: productos, negocio: negocio),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeIn(
              delay: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Catalogo de Promociones'),
                    SizedBox(
                      height: 250,
                      child: PromocionesList(promociones: promociones),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeIn(
              delay: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Catalogo de Cupones'),
                    SizedBox(
                      height: 250,
                      child: CuponesList(cupones: cupones),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
