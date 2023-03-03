import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static const String name = "welcome_screen";

  const WelcomeScreen({super.key});

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
                  height: 50,
                )
                ,
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
                  height: 20.0,
                ),
                SizedBox(
                    width: 260.00,
                    height: 50,
                    child: CustomElevatedButton(
                      func: () {
                        //context.push('/login');
                        context.pushNamed(LoginScreen.name);
                      },
                      label: 'Login',
                      color: Colors.orange,
                    ) //boton,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: 260.00,
                  height: 50,
                  child: CustomElevatedButton(
                      func: () {
                        context.pushNamed(RegisterScreen.name);
                      },
                      label: 'Registrarte',
                      color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
