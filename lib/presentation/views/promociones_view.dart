import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/promociones/promociones_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class PromocionesView extends StatelessWidget {
  static const String name = "promociones_screen";
  const PromocionesView({super.key});

  @override
  Widget build(BuildContext context) {
    final promociones = context.read<PromocionesBloc>().state.promociones;
    final negocios = context.read<NegociosBloc>().state.negocios;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 230,
              ),
              itemCount: promociones.length,
              itemBuilder: (context, index) {
                final promocion = promociones[index];
                final negocio = negocios.where(
                  (element) => element.id == promocion.idNegocio,
                );

                return GestureDetector(
                  onTap: () =>
                      context.push('/home/0/promocion/${promocion.id}'),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: ImageLoading(
                                      photoUrl: negocio.first.photoUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    promocion.descripcion,
                                    maxLines: 4,
                                    softWrap: true,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Subtitle',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: bgContainer,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(1),
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(10),
                      //       child: Image.asset(
                      //         'assets/images/price-tag.png',
                      //         fit: BoxFit.cover,
                      //         width: 150,
                      //         height: 150,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // Expanded(
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         maxLines: 3,
                      //         softWrap: true,
                      //         promocion.descripcion,
                      //         textAlign: TextAlign.center,
                      //         style: const TextStyle(
                      //           fontSize: 14,
                      //           fontFamily: 'Poppins',
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}



                              // CircleAvatar(
                              //   child: Icon(
                              //     Icons.local_offer_outlined,
                              //     color: Theme.of(context).primaryColor,
                              //   ),
                              // ),