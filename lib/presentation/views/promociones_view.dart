import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';

import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class PromocionesView extends StatefulWidget {
  static const String name = "promociones_screen";
  const PromocionesView({super.key});

  @override
  State<PromocionesView> createState() => _PromocionesViewState();
}

class _PromocionesViewState extends State<PromocionesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final promociones = context.watch<PromocionesBloc>().state.promociones;
    final negocios = context.read<NegociosBloc>().state.negocios;

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '${promociones.length} OFERTAS',
              style:
                  const TextStyle(fontSize: 16, backgroundColor: bgContainer),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                //await Future.delayed(const Duration(seconds: 2))
                context.read<NegociosBloc>().add(const NegociosFetched());
                context
                    .read<PromocionesBloc>()
                    .add(const PromocionesFetchAll());
              },
              child: FadeIn(
                delay: const Duration(milliseconds: 200),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 200,
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
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: bgContainer),
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ImageLoading(
                                      photoUrl: negocio.first.photoUrl,
                                      height: 70,
                                      width: 50,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        promocion.descripcion,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      negocio.first.nombreEmpresa,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10),
                                          color: Colors.white),
                                      child: Icon(
                                        Icons.local_offer_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

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
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}



                              // CircleAvatar(
                              //   child: Icon(
                              //     Icons.local_offer_outlined,
                              //     color: Theme.of(context).primaryColor,
                              //   ),
                              // ),