import 'package:flutter/material.dart';

class RegisterImage extends StatelessWidget {
  const RegisterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 100,
        height: 100,
        //padding: const EdgeInsets.all(30),
        child: Icon(
          Icons.account_circle,
          color: Colors.black38,
          size: 100,
        ));
  }
}
