import 'package:flutter/material.dart';

import 'package:flutter_shopping_mxl_v2/presentation/screens/login/widgets/form_login.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens/login/widgets/login_image.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String name = "login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final status = context.read<AuthenticationBloc>().state;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sign in',
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: _LoginView()),
    );
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
              const LoginImage(),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 350,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(30),
                child: const FormLogin(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '-o inicia sesión con-',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SocialIconsButtons()
            ],
          ),
        ),
      ),
    );
  }
}
