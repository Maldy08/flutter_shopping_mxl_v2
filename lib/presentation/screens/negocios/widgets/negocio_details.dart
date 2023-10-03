import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/models.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/productos/widgets/widgets.dart';

class NegocioDetails extends StatelessWidget {
  final Negocios negocio;
  final String fontFamily;
  final List<Productos> productos;

  const NegocioDetails({
    super.key,
    required this.negocio,
    required this.fontFamily,
    required this.productos,
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
                  negocio.nombreEmpresa,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ProductosList(productos: productos, negocio: negocio),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Promociones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 200,
              child: _PromocionesList(),
            ),
            Text(
              'Cupones',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 200,
              child: _CuponesList(),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class _PromocionesList extends StatelessWidget {
  const _PromocionesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150,
          child: FadeInRight(
              child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Placeholder(),
          )),
        );
      },
    );
  }
}

class _CuponesList extends StatelessWidget {
  const _CuponesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150,
          child: FadeInRight(
              child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Placeholder(),
          )),
        );
      },
    );
  }
}
