import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/cupones/cupones_bloc.dart';

import 'package:flutter_shopping_mxl_v2/presentation/blocs/productos/productos_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/promociones/promociones_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/cupones/widgets/widgets.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/productos/widgets/widgets.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/promociones/widgets/promociones_list.dart';

class NegocioDetails extends StatelessWidget {
  final Negocios negocio;
  final String fontFamily;
  //final List<Productos> productos;
  //final List<Promociones> promociones;

  const NegocioDetails({
    super.key,
    required this.negocio,
    required this.fontFamily,
    // required this.productos,
    // required this.promociones,
  });

  @override
  Widget build(BuildContext context) {
    final productos = context.watch<ProductosBloc>().state.productosByNegocio;
    final promociones =
        context.watch<PromocionesBloc>().state.promocionesByNegocio;
    final cupones = context.watch<CuponesBloc>().state.cuponesByNegocio;
    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(negocio.id)));
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                negocio.nombreEmpresa,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.direccion,
                    style: TextStyle(fontFamily: fontFamily),
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
                  Icons.schedule,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.horario,
                    style: TextStyle(fontFamily: fontFamily),
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
                  Icons.phone,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    negocio.telefono,
                    style: TextStyle(fontFamily: fontFamily, fontSize: 12),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Productos',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            productos.isNotEmpty
                ? SizedBox(
                    height: 300,
                    child:
                        ProductosList(productos: productos, negocio: negocio),
                  )
                : const Text('Sin productos a mostrar'),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Promociones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            promociones.isNotEmpty
                ? SizedBox(
                    height: 250,
                    child: PromocionesList(promociones: promociones),
                  )
                : const Text('Sin promociones a mostrar'),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Cupones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),

            cupones.isNotEmpty
                ? SizedBox(
                    height: 250,
                    child: CuponesList(
                      cupones: cupones,
                    ),
                  )
                : const Text('Sin cupones a mostrar'),
            const SizedBox(
              height: 40,
            ),
            // const SizedBox(
            //   height: 150,
            //   child: _CuponesList(),
            // ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
