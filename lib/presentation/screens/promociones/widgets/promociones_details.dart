import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';

import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PromocionesDetails extends StatelessWidget {
  final Promociones promocion;
  final Negocios negocio;
  final String fontFamily;

  const PromocionesDetails({
    super.key,
    required this.promocion,
    required this.negocio,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.92;
    const double size01 = 20.0;
    const double size02 = 25.0;
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Parchis Colors:",
                      style: TextStyle(
                          fontSize: size01, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ), // Text Top

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: Colors.red,
                        child: const Center(
                            child: Text("Red Color",
                                style: TextStyle(fontSize: size02))))),
                Expanded(
                    child: Container(
                        color: Colors.yellow,
                        child: const Center(
                            child: Text("Yellow Color",
                                style: TextStyle(fontSize: size02))))),
              ],
            ),
          ), //Row 1/2

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: Colors.green,
                        child: const Center(
                            child: Text("Green Color",
                                style: TextStyle(fontSize: size02))))),
                Expanded(
                    child: Container(
                        color: Colors.blue,
                        child: const Center(
                            child: Text("Blue Color",
                                style: TextStyle(fontSize: size02))))),
              ],
            ),
          ), //Row 2/2
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿What's your favourite color?",
                      style: TextStyle(
                          fontSize: size01, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ), // Text Bottom
        ],
      ),
    );
  }
}

                      // Row(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Container(
                      //           width: width,
                      //           color: Colors.red,
                      //           child: Center(
                      //             child: QrImageView(
                                    
                      //               data: promocion.id,
                      //               size: 70,
                      //               gapless: false,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //   ],
                      // ),


//  color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: Text(
//                 promocion.descripcion,
//                 style: TextStyle(
//                     fontFamily: fontFamily,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.business_center_outlined,
//                   size: 20,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Flexible(
//                   child: Text(
//                     negocio.nombreEmpresa,
//                     style: TextStyle(fontFamily: fontFamily, fontSize: 16),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.date_range_rounded,
//                   size: 20,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Flexible(
//                   child: Text(
//                     promocion.vigencia,
//                     style: TextStyle(fontFamily: fontFamily, fontSize: 16),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Row(
//               children: [
//                 const Icon(
//                   Icons.local_offer_outlined,
//                   size: 20,
//                 ),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Flexible(
//                   child: Text(
//                     promocion.descuento.toString(),
//                     style: TextStyle(fontFamily: fontFamily, fontSize: 16),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),