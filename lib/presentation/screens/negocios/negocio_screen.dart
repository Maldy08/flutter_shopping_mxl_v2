import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class NegocioScreen extends StatelessWidget {
  final int id;
  static const String name = "negocio_screen";
  const NegocioScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Negocio'),
      body: Placeholder(),
    );
  }
}
