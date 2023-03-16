import 'package:flutter/material.dart';

class SocialIconsButtons extends StatelessWidget {
  const SocialIconsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black54);
    final buttonStyle = OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        side: BorderSide(color: Colors.grey.shade300),
        backgroundColor: Colors.white);
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
            style: buttonStyle,
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
            style: buttonStyle,
          ),
        ),
      ],
    );
  }
}
