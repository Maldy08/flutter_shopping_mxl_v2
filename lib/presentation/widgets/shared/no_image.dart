import 'package:flutter/material.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/no-image.jpg',
      height: 140,
      width: 120,
      fit: BoxFit.cover,
    );
  }
}
