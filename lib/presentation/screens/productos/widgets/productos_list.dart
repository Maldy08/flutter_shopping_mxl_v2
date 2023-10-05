import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ProductosList extends StatelessWidget {
  const ProductosList({
    super.key,
    required this.productos,
    required this.negocio,
  });

  final List<Productos> productos;
  final Negocios negocio;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productos.length,
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
                  child: context.watch<ProductosBloc>().state.status ==
                          ProductosStatus.fetching
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: productos[index].photoUrl.isNotEmpty
                                      ? Image.network(
                                          productos[index].photoUrl,
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        )
                                      : const NoImage(),
                                ),
                              ),
                            ),
                            Text(
                              productos[index].descripcion,
                              maxLines: 3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              productos[index].precio,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
              onTap: () {
                context.push('/home/0/producto/${productos[index].id}');
              },
            ),
          )),
        );
      },
    );
  }
}
