import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import '/presentation/blocs/blocs.dart';
import '/presentation/screens/productos/widgets/widgets.dart';

class ProductoScreen extends StatefulWidget {
  final String id;
  //final String uid;

  static const String name = "producto_screen";
  const ProductoScreen({super.key, required this.id});

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductosBloc>().add(ProductosFetchedById(widget.id, ''));
    //context.read<ProductosBloc>().add(ProductosFetchedById(id, ui))
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final producto = context.watch<ProductosBloc>().state.producto;
    final negocio = context.watch<NegociosBloc>().state.negocio;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state.status == UserStatus.fetching) {
                  return IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      child: SpinPerfect(
                        infinite: true,
                        child: const Icon(Icons.refresh_outlined),
                      ),
                    ),
                  );
                }

                return IconButton(
                  onPressed: () {
                    context
                        .read<UserBloc>()
                        .add(ToogleFavoritesProducts(producto.id));
                  },
                  icon: context.read<UserBloc>().isFavoriteProduct(producto.id)
                      ? CircleAvatar(
                          child: Icon(
                            Icons.favorite_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const CircleAvatar(
                          child: Icon(
                            Icons.favorite_border,
                          ),
                        ),
                );
              },
            )
          ],
          title: Text(negocio.nombreEmpresa),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: ProductoDetails(
              producto: producto,
            ),
          ),
        ));
  }
}


            // Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: IconButton(
            //       onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
            // )