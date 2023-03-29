import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/register/register_cubit.dart';
import 'package:flutter_shopping_mxl_v2/presentation/screens.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FormRegister extends StatelessWidget {
  FormRegister({super.key});

  final bgContainer = AppTheme.getBackgroundContainerColor();

  @override
  Widget build(BuildContext context) {
    final formRegister = context.watch<RegisterCubit>();

    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onChanged: formRegister.onUsernameChanged,
            decoration: InputDecoration(
                labelText: 'Nombre Completo',
                errorText: formRegister.state.username.errorMessage),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onChanged: formRegister.onAgeChanged,
            decoration: InputDecoration(
                labelText: 'Edad',
                errorText: formRegister.state.age.errorMessage),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            onChanged: formRegister.onSexChanged,
            decoration: InputDecoration(
                labelText: 'Sexo',
                errorText: formRegister.state.sex.errorMessage),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onChanged: formRegister.onEmailChange,
            decoration: InputDecoration(
              labelText: 'Correo',
              errorText: formRegister.state.email.errorMessage,
            ),
          ),
          //Falta incoporar el campo password

          const SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: formRegister.onPhoneChange,
            decoration: InputDecoration(
              labelText: 'Telefono',
              errorText: formRegister.state.phoneNumber.errorMessage,
            ),
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
