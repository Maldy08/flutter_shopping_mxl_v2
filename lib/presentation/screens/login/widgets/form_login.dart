import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final loginForm = context.watch<LoginCubit>();

    return loginForm.state.isPosting
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : Form(
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
                  fillColor: bgContainer,
                  labelText: 'Correo',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  errorText: loginForm.state.isFormPosted
                      ? loginForm.state.email.errorMessage
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: loginForm.onPasswordChanged,
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
                      loginForm.onSubmit();
                      // context.read<LoginCubit>().loginWithEmaildAndPassword(
                      //     'carlos@google.com', 'Abc123');
                    },
                    label: 'Iniciar sesión',
                    color: Colors.orange),
              )
            ],
          ));
  }
}
