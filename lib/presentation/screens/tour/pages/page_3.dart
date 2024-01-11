import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: FadeIn(
        delay: const Duration(milliseconds: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding-2.png',
              fit: BoxFit.contain,
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Una vez que te hayas registrado, puedes empezar a agregar en tus favoritos a negocios locales de tu preferencia, con esto estarás al tanto de todas las ofertas y cupones que tu negocio favorito vaya registrando.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Estas listo para empezar!!!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
