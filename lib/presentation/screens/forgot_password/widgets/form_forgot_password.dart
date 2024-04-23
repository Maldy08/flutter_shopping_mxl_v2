import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/forgot_password/forgot_password_cubit.dart';
import 'package:formz/formz.dart';

import '../../../../config/config.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/shared/custom_elevated_button.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    final theme = Theme.of(context);
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          showSnackbar(
              context, state.errorMessage ?? 'Error al enviar el correo');
        }

        if (state.status == FormzSubmissionStatus.success) {
          showSnackbar(context, 'Correo enviado');
        }
      },
      child: Form(
        child: Column(
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
              onChanged: context.read<ForgotPasswordCubit>().onEmailChange,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: context.watch<ForgotPasswordCubit>().state.isPosting
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : CustomElevatedButton(
                      func: () async {
                        // showSnackbar(context, 'message');
                        await context
                            .read<ForgotPasswordCubit>()
                            .resetPassword();
                        //formRegister.onSubmit();
                        //context.pushReplacementNamed(AccountCreatedScreen.name);
                      },
                      label: 'Recuperar contraseña',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
