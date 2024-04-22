import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const Text(
          'Ingresa tu correo electrónico para recuperar tu contraseña',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.mail_outline,
              color: theme.primaryColor,
            ),
            filled: true,
            fillColor: bgContainer,
            labelText: 'Correo',
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Recuperar contraseña'),
        ),
      ],
    );
  }
}
