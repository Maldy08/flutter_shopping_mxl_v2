import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import '/config/config.dart';
import '/presentation/screens.dart';
import '/presentation/widgets/widgets.dart';

class AccountCreatedScreen extends StatelessWidget {
  static const String name = "account_created_screen";
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundContainerColor(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AccountCreatedImage(),
                const SizedBox(height: 10),
                Container(
                    width: 350,
                    height: 300,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Cuenta Creada!',
                          style: TextStyle(fontSize: 30, color: Colors.blue),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Tu cuenta ha sido creada',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          'correctamente',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FadeIn(
                            delay: const Duration(milliseconds: 1500),
                            child: CustomElevatedButton(
                              label: 'Iniciar sesion',
                              color: Colors.orange,
                              func: () {
                                context.go('/home/0');
                              },
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
