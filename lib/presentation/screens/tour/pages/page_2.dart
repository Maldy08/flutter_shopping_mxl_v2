import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
              'assets/images/onboarding-3.png',
              fit: BoxFit.contain,
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Solo necesitas un correo electrónico para poder registrarte, o también puedes iniciar sesión con tu cuenta de Google, o con tu Apple ID (si eres usuario de iOS).',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
