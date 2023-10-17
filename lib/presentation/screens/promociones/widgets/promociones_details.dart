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

    return const Placeholder();
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