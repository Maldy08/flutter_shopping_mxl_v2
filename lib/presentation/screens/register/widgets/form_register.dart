import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FormRegister extends StatelessWidget {
  FormRegister({super.key});

  final bgContainer = AppTheme.getBackgroundContainerColor();

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
          //Falta incoporar el campo password

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

          // DropdownButtonFormField(
          //   decoration: const InputDecoration(
          //     enabledBorder: OutlineInputBorder(
          //       //<-- SEE HERE
          //       borderSide: BorderSide(color: Colors.black, width: 2),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       //<-- SEE HERE
          //       borderSide: BorderSide(color: Colors.black, width: 2),
          //     ),
          //     filled: true,
          //     fillColor: Colors.greenAccent,
          //   ),
          //   dropdownColor: Colors.greenAccent,
          //   value: dropdownValue,
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       dropdownValue = newValue!;
          //     });
          //   },
          //   items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
          //       .map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(
          //         value,
          //         style: const TextStyle(fontSize: 20),
          //       ),
          //     );
          //   }).toList(),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
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
