import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '/presentation/blocs/blocs.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Platform.isIOS
            ? const AppleButton()
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(height: 10),
        SizedBox(
            height: 44,
            width: 300,
            child: OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                context.read<LoginCubit>().logInWithGoogle();
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/google-logo.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class AppleButton extends StatelessWidget {
  const AppleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 300,
      child: SignInWithAppleButton(
        style: SignInWithAppleButtonStyle.black,
        onPressed: () {
          context.read<LoginCubit>().logInWithApple();
        },
      ),
    );
  }
}
