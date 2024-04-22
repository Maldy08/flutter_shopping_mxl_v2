import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../config/theme/app_theme.dart';
import '../../widgets/shared/custom_appbar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Recuperar contraseña'),
        backgroundColor: AppTheme.getBackgroundContainerColor(),
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    'assets/images/forgot_password.png',
                  ),
                ),
                Container(
                  width: 350,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(30),
                  child: const FormForgotPassword(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
