import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class AvisoPrivacidadScreen extends StatelessWidget {
  static const String name = "aviso_privacidad_screen";
  const AvisoPrivacidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Aviso de privacidad'),
      body: Placeholder(),
    );
  }
}
