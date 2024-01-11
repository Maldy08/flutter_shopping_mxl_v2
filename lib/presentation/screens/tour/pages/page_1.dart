import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: FadeIn(
        delay: const Duration(milliseconds: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding-1.png',
              fit: BoxFit.contain,
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenido a EnOfferta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const Text(
              'Donde podrás encontrar cupones y descuentos de comercios de la localidad.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
