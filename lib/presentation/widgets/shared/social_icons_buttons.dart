import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:flutter_shopping_mxl_v2/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:go_router/go_router.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black54);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 150,
          child: FilledButton.icon(
            clipBehavior: Clip.hardEdge,
            onPressed: () {},
            icon: Image.asset('assets/images/facebook-logo.png', height: 30),
            label: const Text(
              'Facebook',
              style: textStyle,
            ),
            style: AppTheme.outlinedButtonStyle(),
          ),
        ),
        const SizedBox(width: 5),
        SizedBox(
          height: 50,
          width: 150,
          child: FilledButton.icon(
            onPressed: () {
              context.read<AuthenticationBloc>().onGoogleSingIn();
              // context.push('/home/0');
            },
            icon: Image.asset('assets/images/google-logo.png', height: 30),
            label: const Text(
              'Google',
              style: textStyle,
            ),
            style: AppTheme.outlinedButtonStyle(),
          ),
        ),
      ],
    );
  }
}
