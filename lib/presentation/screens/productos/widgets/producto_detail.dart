// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '/config/config.dart';
import '/presentation/widgets/widgets.dart';
import '/infrastructure/models/models.dart';

class ProductoDetails extends StatelessWidget {
  final Productos producto;

  // final List<Productos> productos;

  const ProductoDetails({
    super.key,
    required this.producto,

    // required this.productos,
  });

  @override
  Widget build(BuildContext context) {
    // final productos = context.watch<ProductosBloc>().state.productos;
    return Container(
      color: bgContainer,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(200), // Image radius
                      child: ImageLoading(
                        photoUrl: producto.photoUrl,
                      )),
                )),
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
                          // height: 200,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.descripcion,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                producto.precio,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // FilledButton.icon(
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.category),
                              //     label: Text(producto.idCategoria))
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
                              data: producto.id,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.white),
              //   width: double.infinity,
              //   child: Padding(
              //     padding: const EdgeInsets.all(15),
              //     child: Center(
              //       child: Text(
              //         '',
              //         textAlign: TextAlign.justify,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              FilledButton(onPressed: () {}, child: Text(producto.id)),
              // const SizedBox(height: 10),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.white),
              //   padding: const EdgeInsets.all(15),
              //   child: BarcodeWidget(
              //     data: producto.id,
              //     barcode: Barcode.code128(),
              //     width: double.infinity,
              //     height: 100,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
