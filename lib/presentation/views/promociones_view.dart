import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/promociones/promociones_bloc.dart';
import 'package:go_router/go_router.dart';

class PromocionesView extends StatelessWidget {
  static const String name = "promociones_screen";
  const PromocionesView({super.key});

  @override
  Widget build(BuildContext context) {
    final promociones = context.read<PromocionesBloc>().state.promociones;
    final height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top * 0.3;

    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 250, crossAxisSpacing: 9),
              itemCount: promociones.length,
              itemBuilder: (context, index) {
                final promocion = promociones[index];
                return GestureDetector(
                  onTap: () =>
                      context.push('/home/0/promocion/${promocion.id}'),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: bgContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/price-tag.png',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              maxLines: 3,
                              softWrap: true,
                              promocion.descripcion,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
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
