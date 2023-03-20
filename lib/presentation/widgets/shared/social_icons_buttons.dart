import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mxl_v2/config/theme/app_theme.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
            onPressed: () {},
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
