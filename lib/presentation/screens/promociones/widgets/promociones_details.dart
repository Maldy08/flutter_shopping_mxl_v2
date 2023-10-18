import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_shopping_mxl_v2/config/config.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/negocios.dart';
import 'package:flutter_shopping_mxl_v2/infrastructure/models/promociones.dart';

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
    //final width = MediaQuery.of(context).size.width * 0.92;
    return Container(
      color: bgContainer,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 150,
                child: Center(
                  child: Image.asset(
                    'assets/images/price-tag.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                negocio.nombreEmpresa,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                promocion.vigencia,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: QrImageView(
                              data: promocion.id,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      promocion.descripcion,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: Text(promocion.id)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: const EdgeInsets.all(15),
                child: BarcodeWidget(
                  data: promocion.id,
                  barcode: Barcode.code128(),
                  width: double.infinity,
                  height: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
