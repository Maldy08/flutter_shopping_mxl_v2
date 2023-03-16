import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.mail_outline,
              color: theme.primaryColor,
            ),
            filled: true,
            fillColor: AppTheme.getBackgroundContainerColor(),
            labelText: 'Correo',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: theme.primaryColor,
            ),
            filled: true,
            fillColor: bgContainer,
            labelText: 'Password',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
              func: () {
                context.go('/home/0');
              },
              label: 'Iniciar sesión',
              color: Colors.orange),
        )
      ],
    ));
  }
}
