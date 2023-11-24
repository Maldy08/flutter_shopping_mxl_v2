import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/config/config.dart';
import '/presentation/blocs/cupones/cupones_bloc.dart';
import '/presentation/blocs/negocios/negocios_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class CuponesView extends StatelessWidget {
  static const String name = "cupones_screen";
  const CuponesView({super.key});

  @override
  Widget build(BuildContext context) {
    final cupones = context.watch<CuponesBloc>().state.cupones;
    final negocios = context.read<NegociosBloc>().state.negocios;

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${cupones.length} Cupones',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<CuponesBloc>().add(const CuponesFetchAll());
              },
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
                itemCount: cupones.length,
                itemBuilder: (context, index) {
                  final cupon = cupones[index];
                  final negocio = negocios.where(
                    (element) => element.id == cupon.idNegocio,
                  );

                  return GestureDetector(
                    onTap: () => context.push('/home/0/cupon/${cupon.id}'),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      cupon.descripcion,
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
                                      Icons.local_activity_outlined,
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
          )
        ],
      ),
    );
  }
}
