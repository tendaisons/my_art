import 'package:flutter/material.dart';
import 'package:my_art/src/constants/colors.dart';
import 'package:my_art/src/constants/sizes.dart';

// Light & Dark Outlined Button Themes

class TOutlinedButtonTheme {

  // To avoid Creating Instances
  TOutlinedButtonTheme._();

  // Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: const BorderSide(color: tSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
  ));

  // Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
  ));
}