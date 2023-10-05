import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              promociones[index].photoUrl,
                              height: 140,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
