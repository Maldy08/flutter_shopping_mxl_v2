import 'package:flutter/material.dart';

class AccountCreatedImage extends StatelessWidget {
  const AccountCreatedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(30),
      //   ),
      // ),
      child: Image.asset(
        'assets/images/create-account-success.png',
      ),
    );
  }
}
