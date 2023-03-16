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
    final theme = Theme.of(context);
    final buttonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      side: BorderSide(color: theme.primaryColor),
    );

    return FilledButton(
      onPressed: func,
      style: buttonStyle,
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
