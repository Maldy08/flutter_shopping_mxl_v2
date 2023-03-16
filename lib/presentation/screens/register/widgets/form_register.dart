import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FormRegister extends StatelessWidget {
  final bgContainer = AppTheme.getBackgroundContainerColor();
  FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Nombre Completo',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Edad'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Sexo'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Correo'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Telefono'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Codigo Postal'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              func: () {
                context.pushReplacementNamed(AccountCreatedScreen.name);
              },
              label: 'Crear Cuenta',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              const Text('Ya tienes cuenta?'),
              TextButton(
                  onPressed: () {
                    context.pushNamed(LoginScreen.name);
                  },
                  child: const Text(
                    'Inicia sesión',
                  ))
            ],
          )
        ],
      ),
    );
  }
}
