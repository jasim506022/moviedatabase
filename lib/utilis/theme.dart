import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themedata() {
  return ThemeData(
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            wordSpacing: 1.5),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xff1a1d1f),
            systemNavigationBarIconBrightness: Brightness.dark),
        backgroundColor: const Color(0xff1a1d1f)),
    scaffoldBackgroundColor: const Color(0xff1a1d1f),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.domine(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w800,
          wordSpacing: 2),
      titleMedium: GoogleFonts.domine(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          wordSpacing: 2),
      titleSmall: GoogleFonts.poppins(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
      bodySmall: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
    ),
  );
}
