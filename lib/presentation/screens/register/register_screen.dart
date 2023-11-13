import 'package:flutter/material.dart';

import '/config/config.dart';
import '/presentation/screens/register/widgets/form_register.dart';
import '/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = "register_screen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Sign Up'),
        backgroundColor: AppTheme.getBackgroundContainerColor(),
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(30),
                  child: const FormRegister(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
