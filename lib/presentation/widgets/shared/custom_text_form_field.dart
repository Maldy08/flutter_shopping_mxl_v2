import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 20, color: Colors.black54),
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(
            color: colors.primary, fontWeight: FontWeight.bold, fontSize: 18),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedErrorBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.transparent)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
        // icon: Icon( Icons.supervised_user_circle_outlined, color: colors.primary, )
      ),
    );
  }
}
