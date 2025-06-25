import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 25, 43, 117),
  colorScheme: ColorScheme.light(
    primary: const Color.fromRGBO(25, 43, 117, 1),
    secondary: const Color.fromRGBO(255, 165, 0, 1),
    tertiary: const Color.fromARGB(255, 195, 4, 51),
  ),
);

Color secondary(BuildContext context) {
  return Theme.of(context).colorScheme.secondary;
}

Color primary(BuildContext context) {
  return Theme.of(context).colorScheme.primary;
}

Color tertiary(BuildContext context) {
  return Theme.of(context).colorScheme.tertiary;
}
