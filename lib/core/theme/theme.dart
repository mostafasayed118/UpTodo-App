import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    // scaffold background color
    scaffoldBackgroundColor: AppColors.background,
    // appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 18,
        color: AppColors.white,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white.withOpacity(0.44),
      ),
    ),
    //button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    // scaffold background color
    scaffoldBackgroundColor: AppColors.red,
    // appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 18,
        color: AppColors.white,
      ),
      displaySmall: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white.withOpacity(0.44),
      ),
    ),
    //button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
