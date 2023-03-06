import 'package:flutter/material.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(0.5),
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login con Google')));
            },
            icon: Image.asset(
              'assets/images/google-logo.png',
              height: 60,
              width: 60,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0.5),
          child: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login con Facebook')));
            },
            icon: Image.asset(
              'assets/images/facebook-logo.png',
              height: 60,
              width: 60,
            ),
          ),
        ),
      ],
    );
  }
}
