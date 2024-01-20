import 'package:flutter/material.dart';
import 'package:my_art/src/constants/colors.dart';
import 'package:my_art/src/constants/sizes.dart';

// Light & Dark Elevated Button Themes

class TElevatedButtonTheme {

  // To avoid Creating instances
  TElevatedButtonTheme._(); 

  // Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
  ));

  // Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
     style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
  ));
}