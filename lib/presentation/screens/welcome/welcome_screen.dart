import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

import '/config/theme/app_theme.dart';
import '/presentation/screens.dart';
import '/presentation/widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  static const String name = "welcome_screen";

  static Page<void> page() => const MaterialPage<void>(child: WelcomeScreen());

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SharedPreferencesBloc>().add(const SharedPreferencesSave());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgContainer,
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
                ),
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
                  height: 25.0,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
