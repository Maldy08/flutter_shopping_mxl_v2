import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/productos/productos_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/productos/widgets/widgets.dart';

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
    const fontFamily = "Poppins";

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.favorite_outline)),
            )
          ],
          title: Text(negocio.nombreEmpresa),
          centerTitle: true,
        ),
        body: SizedBox(
          child: ProductoDetails(
            fontFamily: fontFamily,
            producto: producto,
          ),
        ));
  }
}
