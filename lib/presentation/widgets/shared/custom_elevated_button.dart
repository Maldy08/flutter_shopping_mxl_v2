import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? func;
  final String label;
  final Color? color;

  const CustomElevatedButton({
    super.key,
    this.func,
    required this.label,
    color,
  }) : color = color ?? Colors.blue;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: func,
      style: const ButtonStyle(
        enableFeedback: true,
      ),
      // style: ButtonStyle(
      //   elevation: const MaterialStatePropertyAll(0),
      //   foregroundColor: const MaterialStatePropertyAll(Colors.white),
        
      //   backgroundColor: MaterialStatePropertyAll(
      //     color,
      //   ),
      //   shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30.0),
      //     ),
      //   ),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
