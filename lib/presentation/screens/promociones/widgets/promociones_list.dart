import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
// import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

class PromocionesList extends StatelessWidget {
  final List<Promociones> promociones;

  const PromocionesList({super.key, required this.promociones});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: promociones.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150,
          child: FadeInRight(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: context.watch<PromocionesBloc>().state.status ==
                        PromocionesStatus.fetching
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: bgContainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(60),
                                  child: Image.asset(
                                    'assets/images/price-tag.png',
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            promociones[index].descripcion,
                            maxLines: 3,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   promociones[index].vigencia,
                          //   style: const TextStyle(fontWeight: FontWeight.bold),
                          // )
                        ],
                      ),
              ),
              onTap: () {
                context.push('/home/0/promocion/${promociones[index].id}');
              },
            ),
          )),
        );
      },
    );
  }
}
