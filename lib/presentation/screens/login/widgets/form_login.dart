import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/blocs.dart';
import 'package:flutter_shopping_mxl_v2/presentation/widgets/widgets.dart';
import 'package:formz/formz.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().initializeState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    final theme = Theme.of(context);

    //final loginForm = context.watch<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          showSnackbar(context, state.errorMessage ?? 'Authentication Failed');
        }
      },
      child: Form(
        child: SingleChildScrollView(
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
                    errorText: context.read<LoginCubit>().state.isFormPosted
                        ? context.read<LoginCubit>().state.email.errorMessage
                        : null),
                keyboardType: TextInputType.emailAddress,
                onChanged: context.read<LoginCubit>().onEmailChange,
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
                    errorText: context.read<LoginCubit>().state.isFormPosted
                        ? context.read<LoginCubit>().state.password.errorMessage
                        : null),
                keyboardType: TextInputType.text,
                onChanged: context.read<LoginCubit>().onPasswordChanged,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: context.watch<LoginCubit>().state.isPosting
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : CustomElevatedButton(
                        func: () {
                          // showSnackbar(context, 'Hola mundo');
                          context.read<LoginCubit>().onSubmit();
                          // context.read<LoginCubit>().loginWithEmaildAndPassword(
                          //     'carlos@google.com', 'Abc123');
                        },
                        label: 'Iniciar sesión',
                        color: Colors.orange),
              )
            ],
          ),
        ),
      ),
    );
  }
}
