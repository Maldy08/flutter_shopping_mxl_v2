import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/theme/app_theme.dart';
import '/presentation/blocs/register/register_cubit.dart';
import '/presentation/screens.dart';
import '/presentation/widgets/widgets.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final bgContainer = AppTheme.getBackgroundContainerColor();
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>().initializeState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final formRegister = context.watch<RegisterCubit>();

    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          showSnackbar(context, state.errorMessage ?? 'Registration Failed');
        }
      },
      child: Form(
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              onChanged: context.watch<RegisterCubit>().onUsernameChanged,
              decoration: InputDecoration(
                labelText: 'Nombre Completo',
                errorText: context.watch<RegisterCubit>().state.isFormPosted
                    ? context.watch<RegisterCubit>().state.username.errorMessage
                    : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.number,
            //   onChanged: formRegister.onAgeChanged,
            //   decoration: InputDecoration(
            //       labelText: 'Edad',
            //       errorText: formRegister.state.age.errorMessage),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // TextFormField(
            //   textInputAction: TextInputAction.next,
            //   onChanged: formRegister.onSexChanged,
            //   decoration: InputDecoration(
            //       labelText: 'Sexo',
            //       errorText: formRegister.state.sex.errorMessage),
            // ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: context.watch<RegisterCubit>().onEmailChange,
              decoration: InputDecoration(
                labelText: 'Correo',
                errorText: context.watch<RegisterCubit>().state.isFormPosted
                    ? context.watch<RegisterCubit>().state.email.errorMessage
                    : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              onChanged: context.watch<RegisterCubit>().onPasswordChanged,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: context.watch<RegisterCubit>().state.isFormPosted
                    ? context.watch<RegisterCubit>().state.password.errorMessage
                    : null,
              ),
            ),
            //Falta incoporar el campo password

            const SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   textInputAction: TextInputAction.next,
            //   keyboardType: TextInputType.phone,
            //   onChanged: formRegister.onPhoneChange,
            //   decoration: InputDecoration(
            //     labelText: 'Telefono',
            //     errorText: formRegister.state.phoneNumber.errorMessage,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

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
              child: context.watch<RegisterCubit>().state.isPosting
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : CustomElevatedButton(
                      func: () async {
                        // showSnackbar(context, 'message');
                        await context.read<RegisterCubit>().onSubmit();
                        //formRegister.onSubmit();
                        //context.pushReplacementNamed(AccountCreatedScreen.name);
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
      ),
    );
  }
}
