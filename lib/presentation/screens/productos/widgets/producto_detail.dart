// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
// import 'package:flutter_shopping_mxl_v2/presentation/screens/productos/widgets/widgets.dart';

class ProductoDetails extends StatelessWidget {
  final Productos producto;
  final String fontFamily;
  // final List<Productos> productos;

  const ProductoDetails({
    super.key,
    required this.producto,
    required this.fontFamily,
    // required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    // final productos = context.watch<ProductosBloc>().state.productos;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Flexible(
                child: Text(
                  producto.descripcion,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    producto.precio,
                    style: TextStyle(fontFamily: fontFamily, fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.category_outlined,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    producto.idCategoria,
                    style: TextStyle(fontFamily: fontFamily, fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.business_center_outlined,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    producto.nombreNegocio,
                    style: TextStyle(fontFamily: fontFamily, fontSize: 16),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
