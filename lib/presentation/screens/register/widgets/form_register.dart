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
        child: ListView(
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
          // decoration: InputDecoration(
          //   isDense: true,
          //   filled: true,
          //   fillColor: bgContainer,
          //   labelText: 'Edad',
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide.none,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(25),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          // decoration: InputDecoration(
          //   isDense: true,
          //   filled: true,
          //   fillColor: bgContainer,
          //   labelText: 'Sexo',
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide.none,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(25),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          // decoration: InputDecoration(
          //   isDense: true,
          //   filled: true,
          //   fillColor: bgContainer,
          //   labelText: 'Correo',
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide.none,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(25),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,

          // decoration: InputDecoration(
          //   isDense: true,
          //   filled: true,
          //   fillColor: bgContainer,
          //   labelText: 'Telefono',
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide.none,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(25),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          // decoration: InputDecoration(
          //   isDense: true,
          //   filled: true,
          //   fillColor: bgContainer,
          //   labelText: 'Codigo Postal',
          //   border: const OutlineInputBorder(
          //     borderSide: BorderSide.none,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(25),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomElevatedButton(
            func: () {}, label: 'Crear Cuenta', color: Colors.orange),
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
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        )
      ],
    ));
  }
}
