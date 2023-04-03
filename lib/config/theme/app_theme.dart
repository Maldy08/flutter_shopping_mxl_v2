import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xff364FD4),
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.pink,
  Colors.orange,
];

const Color bgContainer = Color.fromRGBO(249, 249, 255, 1);

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  static Color getBackgroundContainerColor() {
    return Colors.white; //const Color.fromRGBO(249, 249, 255, 1);
  }

  static ButtonStyle outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        side: BorderSide(color: Colors.grey.shade300),
        backgroundColor: Colors.white);
  }

  static ButtonStyle outlinedButtonStyleAlignCenterLeft() {
    return OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        side: BorderSide(color: Colors.grey.shade300),
        alignment: Alignment.centerLeft,
        backgroundColor: const Color(0xffF0F3F8));
  }

  static ButtonStyle iconButton() {
    return IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(20),
        elevation: 20,
        shadowColor: const Color.fromARGB(44, 5, 5, 5),
        backgroundColor: Colors.white);
  }

  static ButtonStyle iconButtonSettings() {
    return IconButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        elevation: 20,
        backgroundColor: const Color(0xffF0F3F8));
  }

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorSchemeSeed: colorList[selectedColor],
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: bgContainer,
        isDense: true,
        labelStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
