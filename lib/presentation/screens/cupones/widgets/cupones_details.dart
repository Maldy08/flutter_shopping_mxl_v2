import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';

import 'package:flutter_shopping_mxl_v2/infrastructure/models/cupones.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CuponesDetails extends StatelessWidget {
  final Cupones cupon;
  final Negocios negocio;
  final String fontFamily;

  const CuponesDetails({
    super.key,
    required this.cupon,
    required this.negocio,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: bgContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    cupon.descripcion,
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
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
                        negocio.nombreEmpresa,
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
                      Icons.date_range_rounded,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        cupon.vigencia,
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
                      Icons.local_offer_outlined,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        cupon.descuento.toString(),
                        style: TextStyle(fontFamily: fontFamily, fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: bgContainer,
                          context: context,
                          useSafeArea: true,
                          builder: ((context) {
                            return Center(
                              child: QrImageView(
                                data: cupon.id,
                                size: 320,
                                gapless: false,
                              ),
                            );
                          }));
                    },
                    icon: const Icon(Icons.generating_tokens_outlined),
                    label: const Text(
                      'Generar cupon!',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
