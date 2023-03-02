import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
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
    return const Color.fromRGBO(249, 249, 255, 1);
  }

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: bgContainer,
        isDense: true,
        labelStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
