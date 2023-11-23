import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '/config/config.dart';
import '/infrastructure/models/cupones.dart';
import '/infrastructure/models/negocios.dart';

class CuponesDetails extends StatelessWidget {
  final Cupones cupon;
  final Negocios negocio;

  const CuponesDetails({
    super.key,
    required this.cupon,
    required this.negocio,
  });

  @override
  Widget build(BuildContext context) {
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
                    'assets/images/cupon.png',
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
                                cupon.vigencia,
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
                              data: cupon.id,
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
                      cupon.descripcion,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: Text(cupon.id)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                padding: const EdgeInsets.all(15),
                child: BarcodeWidget(
                  data: cupon.id,
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
