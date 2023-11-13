import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import '/config/config.dart';
import '/infrastructure/models/cupones.dart';
import '/presentation/blocs/cupones/cupones_bloc.dart';

class CuponesList extends StatelessWidget {
  final List<Cupones> cupones;

  const CuponesList({super.key, required this.cupones});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cupones.length,
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
                child: context.watch<CuponesBloc>().state.status ==
                        CuponesStatus.fetching
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
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(60),
                                  child: Image.asset(
                                    'assets/images/cupon.png',
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
                            cupones[index].descripcion,
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
                context.push('/home/0/cupon/${cupones[index].id}');
              },
            ),
          )),
        );
      },
    );
  }
}
