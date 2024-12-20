import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_art/src/constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: tDarkColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tDarkColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tDarkColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: tDarkColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: tDarkColor),
    titleSmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: tWhiteColor),
    displayMedium: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    displaySmall: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    titleLarge: GoogleFonts.poppins(
        fontSize: 12.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    titleSmall: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    bodyMedium: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
  );
}
