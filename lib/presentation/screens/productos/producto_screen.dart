import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/productos/productos_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/productos/widgets/widgets.dart';

class ProductoScreen extends StatefulWidget {
  final int id;
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
    context
        .read<ProductosBloc>()
        .add(ProductosFetchedById(widget.id.toString(), ''));
    //context.read<ProductosBloc>().add(ProductosFetchedById(id, ui))
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final producto = context.watch<ProductosBloc>().state.producto;
    const fontFamily = "Poppins";

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          ProductoSliveAppBar(producto: producto),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    ProductoDetails(producto: producto, fontFamily: fontFamily),
                childCount: 1),
          )
        ],
      ),
    );
  }
}
