import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle get baseStyle =>
      GoogleFonts.roboto(fontWeight: FontWeight.normal, color: const Color.fromARGB(199, 255, 255, 255));
  static TextStyle get heading1 => GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  // status
  static TextStyle get heading2 => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle get buttonText => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
