import 'package:flutter/material.dart';
import '/presentation/widgets/widgets.dart';

class AvisoPrivacidadScreen extends StatelessWidget {
  static const String name = "aviso_privacidad_screen";
  const AvisoPrivacidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Aviso de privacidad'),
      body: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Text(
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
                'Shopping MX, con domicilio en Av. Narciso Mendoza 9, Col. Manuel Ávila Camacho. Naucalpan, Edo. de México, es responsable de recabar sus  datos personales, del uso que se le dé a los mismos y de su protección en términos de lo dispuesto en la Ley Federal de Protección de Datos Personales en Posesión de Particulares, su Reglamento y demás disposiciones aplicables (en adelante la “Ley de Datos”), por lo que pone a su disposición el presente Aviso de Privacidad.'),
          ),
        ),
      ),
    );
  }
}
