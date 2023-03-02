import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getBackgroundContainerColor(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: 310,
              height: 300,
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                'assets/images/app-logo.png',
                width: 140,
                height: 140,
                fit: BoxFit.fitWidth,
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Bienvenido!!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SizedBox(
                  width: 260.00,
                  height: 50,
                  child: CustomElevatedButton(
                    func: () {
                      context.push('/login');
                    },
                    label: 'Login',
                    color: Colors.orange,
                  ) //boton,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: SizedBox(
                width: 260.00,
                height: 50,
                child: CustomElevatedButton(
                    func: () {}, label: 'Registrarte', color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
